import 'package:flutter/material.dart';
import 'package:donut_app_8sc_25_3/utils/donut_tile.dart';

class SmoothieTab extends StatelessWidget {
  SmoothieTab({super.key});

  final List<List<dynamic>> smoothieOnSale = [
    ['Strawberry Smoothie', '90', Colors.pink, 'lib/images/strawberry_donut.png', 'Smoothie Bar'],
    ['Blueberry Smoothie', '100', Colors.purple, 'lib/images/blueberry_donut.png', 'Berry Cafe'],
    ['Grape Smoothie', '95', Colors.purple, 'lib/images/grape_donut.png', 'Grape Spot'],
    ['Ice Cream Smoothie', '110', Colors.blue, 'lib/images/icecream_donut.png', 'Creamy Corner'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: smoothieOnSale.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index) {
        final item = smoothieOnSale[index];
        return DonutTile(
          donutFlavor: item[0],
          donutPrice: item[1],
          donutColor: item[2],
          donutImagePath: item[3],
          donutStore: item[4],
        );
      },
    );
  }
}
