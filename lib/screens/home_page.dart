import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // ícono de la izquierda
        leading: Icon(Icons.menu, color: Colors.grey),
        //ícono de la derecha
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: const Column(
        children: [
          //1. Texto principal

          //2. Pestañas

          //3. Contenido de las pestañas (TabBarView)

          //4. Carrito (Cart)
        ],
      ),
    );
  }
}
