import 'package:flutter/material.dart';
import 'package:donut_app_8sc_25_3/utils/pancake_tile.dart';

class PanCakeTab extends StatelessWidget {
  PanCakeTab({super.key});

  final List<List<dynamic>> pancakeOnSale = [
    ['Classic', '120', Colors.orange, 'lib/images/cheese_burger.png', 'Five Guys'],
    ['Big Carl', '179', Colors.pink, 'lib/images/big_carl.webp', 'Carl Jr.'],
    [
      'Bacon Cheese Burger',
      '199',
      Colors.blue,
      'lib/images/bacon_cheese_burger.webp',
      'BBT',
    ],
    [
      'Crispy Chicken',
      '219',
      Colors.green,
      'lib/images/crispy_chicken.webp',
      'Angry Angus',
    ],
    [
      'Doritos Burger',
      '250',
      Colors.purple,
      'lib/images/doritos_burger.jpeg',
      'KFC',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pancakeOnSale.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index) {
        return PanCakeTile(
          pancakeFlavor: pancakeOnSale[index][0],
          pancakePrice: pancakeOnSale[index][1],
          pancakeColor: pancakeOnSale[index][2],
          pancakeImagePath: pancakeOnSale[index][3],
          pancakeStore: pancakeOnSale[index][4],
        );
      },
    );
  }
}
