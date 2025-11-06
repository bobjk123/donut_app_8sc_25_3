import 'package:flutter/material.dart';
import 'package:donut_app_8sc_25_3/utils/cart.dart';

class PanCakeTile extends StatelessWidget {
  final String pancakeFlavor;
  final String pancakePrice;
  final dynamic pancakeColor;
  final String pancakeImagePath;
  final String pancakeStore;

  const PanCakeTile({
    super.key,
    required this.pancakeFlavor,
    required this.pancakePrice,
    required this.pancakeColor,
    required this.pancakeImagePath,
    required this.pancakeStore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: pancakeColor[50],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: pancakeColor[100],
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
                    "\$$pancakePrice",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: pancakeColor[800],
                    ),
                  ),
                ),
              ],
            ),
            //Imagen de la Dona
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Image.asset(pancakeImagePath),
            ),

            //Nombre de la Dona
            Text(
              pancakeFlavor,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            //Tienda de la Dona
            Text(pancakeStore, style: TextStyle(color: Colors.grey[600])),

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
                      price = double.parse(pancakePrice);
                    } catch (_) {
                      price = 0.0;
                    }
                    Cart.instance.add(price);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$pancakeFlavor added to cart'),
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
