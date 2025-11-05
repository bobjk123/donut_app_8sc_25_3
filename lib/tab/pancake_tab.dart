import 'package:flutter/material.dart';
import 'package:donut_app_8sc_25_3/utils/pancake_tile.dart';

class PanCakeTab extends StatelessWidget {
  PanCakeTab({super.key});

  final List<List<dynamic>> pancakeOnSale = [
    ['Variety Plate', '120', Colors.orange, 'lib/images/variety.jpeg', 'Polly’s Pancake Parlor'],
    ['Pumpkin Pancakes', '179', Colors.pink, 'lib/images/pumpkin.webp', 'Carl Jr.'],
    ['Pancake Flight', '199', Colors.blue, 'lib/images/pancake_flight.webp', 'Snooze'],
    ['Mango Pancakes', '219', Colors.green, 'lib/images/mango_pancakes.webp', 'Pele’s Kitchen'],
    ['Buttermilk Pancakes', '250', Colors.purple, 'lib/images/buttermilk_pancakes.jpg', 'Deluxe Town Diner'],
    ['Blueberry Pancakes', '139', Colors.teal, 'lib/images/blueberry_pancakes.jpg', 'Peter’s Pancakes and Waffles'],
    ['Sourdough Pancakes', '189', Colors.red, 'lib/images/sourdough_pancakes.jpeg', 'Sugar and Spice'],
    ['Pamela’s Pancakes', '279', Colors.brown, 'lib/images/pamelas_pancakes.webp', 'Pamela’s P & G Diner'],
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
