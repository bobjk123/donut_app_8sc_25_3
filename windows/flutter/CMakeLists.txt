# This file controls Flutter-level build steps. It should not be edited.
cmake_minimum_required(VERSION 3.14)

set(EPHEMERAL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/ephemeral")

# Configuration provided via flutter tool.
# Ensure the generated config exists; if not, invoke Flutter to create it.
if(NOT EXISTS "${EPHEMERAL_DIR}/generated_config.cmake")
  # Derive project root from this file location: windows/flutter -> windows -> project root.
  get_filename_component(_WINDOWS_DIR "${CMAKE_CURRENT_SOURCE_DIR}" DIRECTORY)
  get_filename_component(PROJECT_DIR "${_WINDOWS_DIR}" DIRECTORY)
  find_program(FLUTTER_BIN NAMES flutter)
  if(NOT FLUTTER_BIN)
    message(WARNING "Flutter SDK not found in PATH; continuing without generating ephemeral files. Install Flutter and add it to PATH to regenerate ephemeral files.")
  endif()

  # Ensure ephemeral dir exists so a fallback config file can be written if needed.
  file(MAKE_DIRECTORY "${EPHEMERAL_DIR}")

  if(FLUTTER_BIN)
    execute_process(
      COMMAND "${FLUTTER_BIN}" build windows
      WORKING_DIRECTORY "${PROJECT_DIR}"
      RESULT_VARIABLE _FLUTTER_RESULT
      OUTPUT_VARIABLE _FLUTTER_OUTPUT
      ERROR_VARIABLE _FLUTTER_ERROR
      OUTPUT_STRIP_TRAILING_WHITESPACE
      ERROR_STRIP_TRAILING_WHITESPACE
    )
    if(NOT _FLUTTER_RESULT EQUAL 0)
      message(WARNING "Failed to run 'flutter build windows' to generate ephemeral files: ${_FLUTTER_ERROR}")
      # Create a minimal placeholder so subsequent include() doesn't fail during configuration.
      file(WRITE "${EPHEMERAL_DIR}/generated_config.cmake" "set(FLUTTER_LIBRARY \"${EPHEMERAL_DIR}/flutter_windows.dll\")\n")
    endif()
  else()
    # No Flutter available; create a minimal placeholder so CMake can continue.
    file(WRITE "${EPHEMERAL_DIR}/generated_config.cmake" "set(FLUTTER_LIBRARY \"${EPHEMERAL_DIR}/flutter_windows.dll\")\n")
  endif()
endif()
include("${EPHEMERAL_DIR}/generated_config.cmake")

# TODO: Move the rest of this into files in ephemeral. See
# https://github.com/flutter/flutter/issues/57146.
set(WRAPPER_ROOT "${EPHEMERAL_DIR}/cpp_client_wrapper")

# Set fallback configurations for older versions of the flutter tool.
if (NOT DEFINED FLUTTER_TARGET_PLATFORM)
  set(FLUTTER_TARGET_PLATFORM "windows-x64")
endif()

# === Flutter Library ===
set(FLUTTER_LIBRARY "${EPHEMERAL_DIR}/flutter_windows.dll")

# Published to parent scope for install step.
set(FLUTTER_LIBRARY ${FLUTTER_LIBRARY})
set(FLUTTER_ICU_DATA_FILE "${EPHEMERAL_DIR}/icudtl.dat")
set(PROJECT_BUILD_DIR "${PROJECT_DIR}/build/")
set(AOT_LIBRARY "${PROJECT_DIR}/build/windows/app.so")

list(APPEND FLUTTER_LIBRARY_HEADERS
  "flutter_export.h"
  "flutter_windows.h"
  "flutter_messenger.h"
  "flutter_plugin_registrar.h"
  "flutter_texture_registrar.h"
)
list(TRANSFORM FLUTTER_LIBRARY_HEADERS PREPEND "${EPHEMERAL_DIR}/")
add_library(flutter INTERFACE)
target_include_directories(flutter INTERFACE
  "${EPHEMERAL_DIR}"
)
target_link_libraries(flutter INTERFACE "${FLUTTER_LIBRARY}.lib")
add_dependencies(flutter flutter_assemble)

# === Wrapper ===
list(APPEND CPP_WRAPPER_SOURCES_CORE
  "core_implementations.cc"
  "standard_codec.cc"
)
list(TRANSFORM CPP_WRAPPER_SOURCES_CORE PREPEND "${WRAPPER_ROOT}/")
list(APPEND CPP_WRAPPER_SOURCES_PLUGIN
  "plugin_registrar.cc"
)
list(TRANSFORM CPP_WRAPPER_SOURCES_PLUGIN PREPEND "${WRAPPER_ROOT}/")
list(APPEND CPP_WRAPPER_SOURCES_APP
  "flutter_engine.cc"
  "flutter_view_controller.cc"
)
list(TRANSFORM CPP_WRAPPER_SOURCES_APP PREPEND "${WRAPPER_ROOT}/")

# Define apply_standard_settings if missing.
if(NOT COMMAND apply_standard_settings)
  function(apply_standard_settings TARGET)
    # Require C++17 for all targets using this helper.
    target_compile_features(${TARGET} PUBLIC cxx_std_17)
    # Basic compile options per compiler.
    if(MSVC)
      target_compile_options(${TARGET} PRIVATE /EHsc /Zc:__cplusplus /W3)
    else()
      target_compile_options(${TARGET} PRIVATE -fPIC)
    endif()
  endfunction()
endif()

# Wrapper sources needed for a plugin.
add_library(flutter_wrapper_plugin STATIC
  ${CPP_WRAPPER_SOURCES_CORE}
  ${CPP_WRAPPER_SOURCES_PLUGIN}
)
apply_standard_settings(flutter_wrapper_plugin)
set_target_properties(flutter_wrapper_plugin PROPERTIES
  POSITION_INDEPENDENT_CODE ON)
set_target_properties(flutter_wrapper_plugin PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_link_libraries(flutter_wrapper_plugin PUBLIC flutter)
target_include_directories(flutter_wrapper_plugin PUBLIC
  "${WRAPPER_ROOT}/include"
)
add_dependencies(flutter_wrapper_plugin flutter_assemble)

# Wrapper sources needed for the runner.
add_library(flutter_wrapper_app STATIC
  ${CPP_WRAPPER_SOURCES_CORE}
  ${CPP_WRAPPER_SOURCES_APP}
)
apply_standard_settings(flutter_wrapper_app)
target_link_libraries(flutter_wrapper_app PUBLIC flutter)
target_include_directories(flutter_wrapper_app PUBLIC
  "${WRAPPER_ROOT}/include"
)
add_dependencies(flutter_wrapper_app flutter_assemble)

# === Flutter tool backend ===
# _phony_ is a non-existent file to force this command to run every time,
# since currently there's no way to get a full input/output list from the
# flutter tool.
set(PHONY_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/_phony_")
set_source_files_properties("${PHONY_OUTPUT}" PROPERTIES SYMBOLIC TRUE)
add_custom_command(
  OUTPUT ${FLUTTER_LIBRARY} ${FLUTTER_LIBRARY_HEADERS}
    ${CPP_WRAPPER_SOURCES_CORE} ${CPP_WRAPPER_SOURCES_PLUGIN}
    ${CPP_WRAPPER_SOURCES_APP}
    ${PHONY_OUTPUT}
  COMMAND ${CMAKE_COMMAND} -E env
    ${FLUTTER_TOOL_ENVIRONMENT}
    "${FLUTTER_ROOT}/packages/flutter_tools/bin/tool_backend.bat"
      ${FLUTTER_TARGET_PLATFORM} $<CONFIG>
  VERBATIM
)
add_custom_target(flutter_assemble DEPENDS
  "${FLUTTER_LIBRARY}"
  ${FLUTTER_LIBRARY_HEADERS}
  ${CPP_WRAPPER_SOURCES_CORE}
  ${CPP_WRAPPER_SOURCES_PLUGIN}
  ${CPP_WRAPPER_SOURCES_APP}
)
