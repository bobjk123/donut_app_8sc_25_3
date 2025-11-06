import 'package:flutter/material.dart';
import 'package:donut_app_8sc_25_3/utils/cart.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final dynamic donutColor;
  final String donutImagePath;
  final String donutStore;

  const DonutTile({
    super.key,
    required this.donutFlavor,
    required this.donutPrice,
    required this.donutColor,
    required this.donutImagePath,
    required this.donutStore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: donutColor[50],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: donutColor[100],
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
                    "\$$donutPrice",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: donutColor[800],
                    ),
                  ),
                ),
              ],
            ),
            //Imagen de la Dona
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Image.asset(donutImagePath),
            ),

            //Nombre de la Dona
            Text(
              donutFlavor,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            //Tienda de la Dona
            Text(donutStore, style: TextStyle(color: Colors.grey[600])),

            //Botones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Favorito
                Icon(Icons.favorite, color: Colors.pink[800]),

                //Agregar
                TextButton(
                  onPressed: () {
                    // Parse price and add to cart
                    double price = 0.0;
                    try {
                      price = double.parse(donutPrice);
                    } catch (_) {
                      price = 0.0;
                    }
                    Cart.instance.add(price);
                    // Show a small confirmation
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$donutFlavor added to cart'),
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
