import 'package:shopkeeper_part/data/models/vegetable_model.dart';

class VegetableRepository{
  Future<List<Vegetable>> fetchVegetables() async{
    return[
      Vegetable(
          name: "Capcicum",
          price: 140.99,
          imagePath: "assets/vegetables/capcicum.png",
          rating: 3
      ),
      Vegetable(
          name: "Capcicum",
          price: 140.99,
          imagePath: "assets/vegetables/capcicum.png",
          rating: 2
      ),
      Vegetable(
          name: "Capcicum",
          price: 140.99,
          imagePath: "assets/vegetables/capcicum.png",
          rating: 4
      ),
      Vegetable(
          name: "Capcicum",
          price: 140.99,
          imagePath: "assets/vegetables/capcicum.png",
          rating: 1
      ),
      Vegetable(
          name: "Capcicum",
          price: 140.99,
          imagePath: "assets/vegetables/capcicum.png",
          rating: 5
      ),
      Vegetable(
          name: "Capcicum",
          price: 140.99,
          imagePath: "assets/vegetables/capcicum.png",
          rating: 4
      ),
      Vegetable(
          name: "Capcicum",
          price: 140.99,
          imagePath: "assets/vegetables/capcicum.png",
          rating: 2
      ),
      Vegetable(
          name: "Capcicum",
          price: 140.99,
          imagePath: "assets/vegetables/capcicum.png",
          rating: 4
      ),
      Vegetable(
          name: "Capcicum",
          price: 140.99,
          imagePath: "assets/vegetables/capcicum.png",
          rating: 1
      ),
      Vegetable(
          name: "Capcicum",
          price: 140.99,
          imagePath: "assets/vegetables/capcicum.png",
          rating: 5
      ),
      Vegetable(
          name: "Capcicum",
          price: 140.99,
          imagePath: "assets/vegetables/capcicum.png",
          rating: 4
      ),

    ];
  }
}