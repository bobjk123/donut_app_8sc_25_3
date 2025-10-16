import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;
  final String text;
  final bool isSelected;

  const MyTab({
    super.key,
    required this.iconPath,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor = isSelected ? Colors.black : Colors.grey.shade600;
    final Color boxColor = isSelected ? Colors.white : Colors.grey.shade200;
    final Border boxBorder = isSelected
        ? Border.all(color: Colors.black, width: 3)
        : Border.all(color: Colors.grey.shade400, width: 1.0);

    return Tab(
      // 💡 Aumentar la altura del Tab para acomodar el contenido más grande
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(
              8,
            ), // Aumenta el padding interno si quieres más espacio
            decoration: BoxDecoration(
              color: boxColor,
              border: boxBorder,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Image.asset(
              iconPath,
              color: iconColor,
              // 💡 Aumentar el tamaño del icono (ej. de 24 a 30)
              height: 35,
            ),
          ),
          const SizedBox(
            height: 4,
          ), // Aumentar un poco el espacio entre icono y texto
          Text(
            text,
            // 💡 Aumentar el tamaño de la fuente (ej. de 10 a 12)
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
