import 'package:flutter/material.dart';
import '../data/models/vegetable_model.dart';
import '../data/repositories/vegetable_repository.dart';

class VegetableProvider with ChangeNotifier {
  final VegetableRepository repository = VegetableRepository();
  List<Vegetable> _vegetables = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Vegetable> get vegetables => _vegetables;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchVegetables() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _vegetables = await repository.fetchVegetables();
    } catch (e) {
      _errorMessage = "Failed to load data.";
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMoreVegetables() async {
    try {
      // Fetch additional vegetables and add them to the list
      final newVegetables = await repository.fetchVegetables();
      _vegetables.addAll(newVegetables);
      notifyListeners();
    } catch (e) {
      _errorMessage = "Failed to load more data.";
    }
  }
}
