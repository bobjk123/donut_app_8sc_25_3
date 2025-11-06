import 'package:flutter/foundation.dart';

/// Simple singleton cart model used across the app.
class Cart extends ChangeNotifier {
  Cart._();
  static final Cart instance = Cart._();

  int _itemCount = 0;
  double _total = 0.0;

  int get itemCount => _itemCount;
  double get total => _total;

  /// Add an item with given price (expects price in currency units)
  void add(double price) {
    _itemCount += 1;
    _total += price;
    notifyListeners();
  }

  /// Remove one item of given price (best-effort)
  void remove(double price) {
    if (_itemCount <= 0) return;
    _itemCount -= 1;
    _total -= price;
    if (_total < 0) _total = 0;
    notifyListeners();
  }

  /// Clear cart
  void clear() {
    _itemCount = 0;
    _total = 0.0;
    notifyListeners();
  }
}
