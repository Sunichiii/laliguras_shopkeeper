import 'package:flutter/material.dart';
import '../data/models/vegetable_model.dart';

class BasketProvider with ChangeNotifier {
  final List<Vegetable> _items = [
    Vegetable(
      name: "Bok Cabbage",
      price: 149.99,
      imagePath: "assets/vegetables/cabbage.png",
      rating: 4,
      quantity: 1,
    ),
    Vegetable(
      name: "Small Onion",
      price: 140.99,
      imagePath: "assets/vegetables/onion.png",
      rating: 4,
      quantity: 2,
    ),
    Vegetable(
      name: "Potato",
      price: 140.99,
      imagePath: "assets/vegetables/potato.png",
      rating: 4,
      quantity: 2,
    ),
  ];

  final List<Vegetable> _recommendedItems = [
    Vegetable(
      name: "Tomato",
      price: 140.99,
      imagePath: "assets/vegetables/tomato.png",
      rating: 4,
    ),
    Vegetable(
      name: "Potato",
      price: 120.99,
      imagePath: "assets/vegetables/potato.png",
      rating: 4,
    ),
    Vegetable(
      name: "Tomato",
      price: 140.99,
      imagePath: "assets/vegetables/tomato.png",
      rating: 4,
    ),
    Vegetable(
      name: "Potato",
      price: 120.99,
      imagePath: "assets/vegetables/potato.png",
      rating: 4,
    ),
  ];

  List<Vegetable> get items => _items;

  List<Vegetable> getRecommendedItems() {
    return _recommendedItems;
  }

  double get deliveryCharge => 50.0;

  double get totalCost =>
      _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  double get freeDeliveryRemaining => 500 - totalCost > 0 ? 500 - totalCost : 0;

  double get deliveryProgress => totalCost >= 500 ? 1.0 : totalCost / 500.0;

  void updateQuantity(Vegetable vegetable, int newQuantity) {
    if (newQuantity > 0) {
      final index = _items.indexOf(vegetable);
      _items[index] = vegetable.copyWith(quantity: newQuantity);
    } else {
      _items.remove(vegetable);
    }
    notifyListeners();
  }

  void removeFromBasket(Vegetable vegetable) {
    _items.remove(vegetable);
    notifyListeners();
  }

  void addToBasket(Vegetable vegetable) {
    _items.add(vegetable.copyWith(quantity: 1));
    notifyListeners();
  }
}
