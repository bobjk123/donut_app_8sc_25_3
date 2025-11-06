import 'package:flutter/material.dart';
import 'package:donut_app_8sc_25_3/utils/cart.dart';

class PizzaTile extends StatelessWidget {
  final String pizzaFlavor;
  final String pizzaPrice;
  final dynamic pizzaColor;
  final String pizzaImagePath;
  final String pizzaStore;

  const PizzaTile({
    super.key,
    required this.pizzaFlavor,
    required this.pizzaPrice,
    required this.pizzaColor,
    required this.pizzaImagePath,
    required this.pizzaStore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: pizzaColor[50],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: pizzaColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  child: Text(
                    "\$$pizzaPrice",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: pizzaColor[800],
                    ),
                  ),
                ),
              ],
            ),
            //Imagen de la Pizza
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Image.asset(pizzaImagePath),
            ),

            //Nombre de la Pizza
            Text(
              pizzaFlavor,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            //Tienda de la Pizza
            Text(pizzaStore, style: TextStyle(color: Colors.grey[600])),

            //Botones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Favorito
                Icon(Icons.favorite, color: Colors.pink[800]),

                //Agregar
                TextButton(
                  onPressed: () {
                    double price = 0.0;
                    try {
                      price = double.parse(pizzaPrice);
                    } catch (_) {
                      price = 0.0;
                    }
                    Cart.instance.add(price);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$pizzaFlavor added to cart'),
                        duration: const Duration(milliseconds: 700),
                      ),
                    );
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
