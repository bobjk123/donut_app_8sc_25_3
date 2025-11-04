import 'package:flutter/material.dart';
import 'package:donut_app_8sc_25_3/utils/donut_tile.dart';

class PizzaTab extends StatelessWidget {
  PizzaTab({super.key});

  final List<List<dynamic>> pizzaOnSale = [
    [
      'Margherita',
      '220',
      Colors.red,
      'lib/images/chocolate_donut.png',
      'La Piazza',
    ],
    [
      'Pepperoni',
      '250',
      Colors.deepOrange,
      'lib/images/grape_donut.png',
      'Pepperoni House',
    ],
    [
      'BBQ Chicken',
      '270',
      Colors.brown,
      'lib/images/cherry_donut.png',
      'BBQ Pizza',
    ],
    [
      'Veggie',
      '200',
      Colors.green,
      'lib/images/vanilla_donut.png',
      'Green Slice',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pizzaOnSale.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index) {
        final item = pizzaOnSale[index];
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
