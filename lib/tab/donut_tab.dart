import 'package:flutter/material.dart';
import 'package:donut_app_8sc_25_3/utils/donut_tile.dart';

class DonutTab extends StatelessWidget {
  DonutTab({super.key});

  final List<List<dynamic>> donutOnSale = [
    [
      'Chocolate',
      '100',
      Colors.brown,
      'lib/images/chocolate_donut.png',
      'Starbucks',
    ],
    [
      'Strawberry',
      '90',
      Colors.red,
      'lib/images/strawberry_donut.png',
      'Krispy Kreme',
    ],
    [
      'Grape',
      '95',
      Colors.purple,
      'lib/images/grape_donut.png',
      'Dunkin Donuts',
    ],
    ['Ice Cream', '70', Colors.blue, 'lib/images/icecream_donut.png', 'Oxxo'],
    [
      'Vanilla',
      '80',
      Colors.amber,
      'lib/images/vanilla_donut.png',
      'Tere Cazola',
    ],
    [
      'Cherry',
      '85',
      Colors.pink,
      'lib/images/cherry_donut.png',
      'La Familia',
    ],
    [
      'Lemon',
      '75',
      Colors.yellow,
      'lib/images/lemon_donut.png',
      'La Pricipal',
    ],
    [
      'Blueberry',
      '95',
      Colors.indigo,
      'lib/images/blueberry_donut.png',
      'El Globo',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutOnSale.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutOnSale[index][0],
          donutPrice: donutOnSale[index][1],
          donutColor: donutOnSale[index][2],
          donutImagePath: donutOnSale[index][3],
          donutStore: donutOnSale[index][4],
        );
      },
    );
  }
}
