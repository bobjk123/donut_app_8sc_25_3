import 'package:flutter/material.dart';
import 'package:donut_app_8sc_25_3/utils/my_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// 💡 IMPLEMENTAR SingleTickerProviderStateMixin y TabController
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Lista de datos para las pestañas
  final List<Map<String, String>> tabData = [
    {'iconPath': 'lib/icons/donut.png', 'text': 'Donuts'},
    {'iconPath': 'lib/icons/burger.png', 'text': 'Burgers'},
    {'iconPath': 'lib/icons/smoothie.png', 'text': 'Smoothies'},
    {'iconPath': 'lib/icons/pancakes.png', 'text': 'Pancakes'},
    {'iconPath': 'lib/icons/pizza.png', 'text': 'Pizza'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabData.length, vsync: this);
    // Escuchar cambios para forzar la reconstrucción y actualizar el estado
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // 💡 FUNCIÓN PARA CONSTRUIR LAS PESTAÑAS CON EL ESTADO CORRECTO
  List<Widget> _buildTabs() {
    return List<Widget>.generate(tabData.length, (index) {
      return MyTab(
        iconPath: tabData[index]['iconPath']!,
        text: tabData[index]['text']!,
        isSelected:
            _tabController.index == index, // Pasa el estado de selección
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // 💡 REMOVER DefaultTabController y usar TabController
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Icon(Icons.person, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                const Text('I want to ', style: TextStyle(fontSize: 24)),
                Text(
                  'eat',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          // --- Tabs ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TabBar(
              controller: _tabController, // Usa el TabController
              // Eliminar la línea de fondo y el indicador (ya que MyTab lo maneja)
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,

              // Estilos de texto (opcional, pero ayuda a que el texto también cambie)
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.shade600,

              tabs: _buildTabs(), // Usa la función de construcción de pestañas
            ),
          ),

          // Contenido de las pestañas
        ],
      ),
    );
  }
}
