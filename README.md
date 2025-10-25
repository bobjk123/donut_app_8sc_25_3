# Donut Delivery — Sweet Donuts Delivery App 🍩🚚

An attractive, colorful Flutter delivery app showcasing delicious donuts. Browse categories, view product tiles, and add treats to your cart — built with responsive layouts and smooth tab navigation.

## ✨ Quick features (short)
- Responsive product grid with clean tiles
- Category tabs with animated selection and dedicated tab views
- Product cards with image, price badge and quick Add action
- Simple cart affordance and bright, material-inspired UI

## 🧱 Main widgets & UI building blocks
Here are the primary widgets used and what they do in the app:

- GridView + SliverGridDelegate
  - Presents products in a responsive grid. Controls column count, spacing and aspect ratio so donut tiles look balanced on different screens.

- TabBar + TabBarView
  - Top category tabs let users switch between product categories. `TabBarView` keeps content synchronized and provides swipe navigation between tabs.

- Custom Tabs (Tiles)
  - Each tab uses a custom `MyTab` widget that shows an icon inside a rounded box and a label underneath. The selected tab style (border, color) is handled by the widget for a polished appearance.

- Product Tiles / Cards
  - Each tile (implemented as `DonutTile`) contains: image, price badge, product name, store, favorite icon and 'Add' action. Tiles are laid out inside the GridView.

## 🛠️ Technologies & setup (Windows + VS Code)
This project is built with Flutter. Follow these steps on Windows using Visual Studio Code:

1. Install Flutter for Windows
  - Follow the official guide: https://flutter.dev/docs/get-started/install/windows
  - Add the `flutter` tool to your PATH and run `flutter doctor` to verify environment.

2. Install Android tooling
  - Install Android Studio and required Android SDK packages (or use a physical device).
  - Make sure `ANDROID_HOME` / `ANDROID_SDK_ROOT` is set if needed.

3. Install Visual Studio Code and extensions
  - Install the **Flutter** and **Dart** extensions from the VS Code Marketplace.

4. Open the project in VS Code
  - Open this repository folder.
  - From the terminal in VS Code run:

```pwsh
flutter pub get
flutter run
```

  - Or use the Run & Debug pane to start the app on an emulator or device.

5. Useful commands
  - `flutter doctor` — check setup
  - `flutter clean` — remove build artifacts
  - `flutter build apk` — build a release APK

Notes: make sure your emulator is running or your device is connected before `flutter run`.

## 📁 Project structure (important files in `lib/`)
Short map of the core files you'll work with:

- `lib/main.dart` — App entry, theme and route setup
- `lib/screens/home_page.dart` — Main screen: TabBar, TabBarView and overall layout
- `lib/tab/donut_tab.dart` — Example tab: grid of donut tiles
- `lib/utils/donut_tile.dart` — UI for each product tile in the grid
- `lib/utils/my_tab.dart` — Custom tab widget used inside the TabBar
- `lib/screens/*` — Additional screens and pages

Also check `pubspec.yaml` for assets and dependencies (images live under `lib/images` and `lib/icons` in this project).

## 🎬 Demo (GIF)
Add a GIF to show the whole app in action. Recommended location: `assets/demo.gif`.
Then include it in `pubspec.yaml` under `assets:` and the README will display it:

![Demo GIF](assets/demo.gif)

If you don't have the GIF yet, record a short screen capture (3–8s) of:
- Opening the app
- Switching between tabs
- Scrolling the grid
- Tapping Add or favorite

## 🏫 Course & Instructor
- Course: Programming of Mobile Applications
- Instructor: Rodrigo Fidel Gaxiola Sosa

## 🎨 Design credit
Design & visual inspiration by Dstudio — App UI on Dribbble
https://dribbble.com/shots/19649140-App-UI

---

Happy hacking! 🚀 Pull requests and improvements are welcome — especially better animations and accessibility tweaks.

