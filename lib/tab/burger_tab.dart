import 'package:flutter/material.dart';
import 'package:donut_app_8sc_25_3/utils/burger_tile.dart';

class BurgerTab extends StatelessWidget {
  BurgerTab({super.key});

  final List<List<dynamic>> burgerOnSale = [
    [
      'Cheese Burger',
      '120',
      Colors.orange,
      'lib/images/cheese_burger.png',
      'Five Guys',
    ],
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
    ['Whopper', '230', Colors.brown, 'lib/images/whopper.png', 'Burger King'],
    ['Big Mac', '220', Colors.yellow, 'lib/images/big_mac.png', 'McDonalds'],
    ['Baconator', '210', Colors.red, 'lib/images/baconator.png', 'Wendys'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: burgerOnSale.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index) {
        return BurgerTile(
          burgerFlavor: burgerOnSale[index][0],
          burgerPrice: burgerOnSale[index][1],
          burgerColor: burgerOnSale[index][2],
          burgerImagePath: burgerOnSale[index][3],
          burgerStore: burgerOnSale[index][4],
        );
      },
    );
  }
}
