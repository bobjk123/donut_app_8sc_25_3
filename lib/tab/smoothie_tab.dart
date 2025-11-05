import 'package:flutter/material.dart';
import 'package:donut_app_8sc_25_3/utils/smoothie_tile.dart';

class SmoothieTab extends StatelessWidget {
  SmoothieTab({super.key});

  final List<List<dynamic>> smoothieOnSale = [
    [
      'Strawberry',
      '8.99',
      Colors.red,
      'lib/images/strawberry_smoothie.png',
      "OXXO",
    ],
    [
      'Orange',
      '12.50',
      Colors.orange,
      'lib/images/orange_smoothie.png',
      'Costco',
    ],
    [
      'Wild Berries',
      '10.00',
      Colors.purple,
      'lib/images/berries_smoothie.png',
      "La Esperanza",
    ],
    [
      'Blueberry',
      '11.75',
      Colors.blue,
      'lib/images/blueberry_smoothie.png',
      "Mi Cha",
    ],
    [
      'Lemon Bliss',
      '9.50',
      Colors.yellow,
      'lib/images/lemon_smoothie.png',
      'YuCha',
    ],
    [
      'Green Detox',
      '13.25',
      Colors.lightGreen,
      'lib/images/green_smoothie.png',
      'MaCha',
    ],
    [
      'Payaya Punch',
      '9.00',
      Colors.deepOrange,
      'lib/images/papaya_smoothie.png',
      '7-Eleven',
    ],
    [
      'Mango Mania',
      '7.49',
      Colors.limeAccent,
      'lib/images/mango_smoothie.png',
      "Cassava Roots",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: smoothieOnSale.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index) {
        return SmoothieTile(
          smoothieFlavor: smoothieOnSale[index][0],
          smoothiePrice: smoothieOnSale[index][1],
          smoothieColor: smoothieOnSale[index][2],
          smoothieImagePath: smoothieOnSale[index][3],
          smoothieStore: smoothieOnSale[index][4],
        );
      },
    );
  }
}
