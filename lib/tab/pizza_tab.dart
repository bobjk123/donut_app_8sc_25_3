import 'package:flutter/material.dart';
import 'package:donut_app_8sc_25_3/utils/pancake_tile.dart';

class PizzaTab extends StatelessWidget {
  PizzaTab({super.key});

  final List<List<dynamic>> pizzaOnSale = [
    ['Pepperoni Classic', '8.99', Colors.red, 'lib/images/pepperoni.jpg', "Domino's Pizza"],
    ['Supreme', '12.50', Colors.orange, 'lib/images/supreme.png', 'Pizza Hut'],
    ['Margherita', '10.00', Colors.green, 'lib/images/margherita.png', "Papa John's"],
    ['BBQ Chicken', '11.75', Colors.brown, 'lib/images/bbq_chicken.png', "Marco's Pizza"],
    ['Four Cheese', '9.50', Colors.yellow, 'lib/images/four_cheese.png', 'California Pizza Kitchen'],
    ['Meat Lovers', '13.25', Colors.deepOrange, 'lib/images/meat_lovers.webp', 'Little Caesars'],
    ['Veggie Delight', '9.00', Colors.teal, 'lib/images/veggie_delight.png', 'Sbarro'],
    ['Take-and-Bake Special', '7.49', Colors.purple, 'lib/images/take_and_bake.png', "Papa Murphy's"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pizzaOnSale.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index) {
        return PanCakeTile(
          pancakeFlavor: pizzaOnSale[index][0],
          pancakePrice: pizzaOnSale[index][1],
          pancakeColor: pizzaOnSale[index][2],
          pancakeImagePath: pizzaOnSale[index][3],
          pancakeStore: pizzaOnSale[index][4],
        );
      },
    );
  }
}
