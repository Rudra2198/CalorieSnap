import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/food_item.dart';

class MealService extends ChangeNotifier {
  static const String _storageKey = 'meals';
  List<FoodItem> _meals = [];

  List<FoodItem> get meals => _meals;

  double get totalCalories => _meals.fold(0, (sum, meal) => sum + meal.calories);

  Future<void> init() async {
    await _loadMeals();
  }

  Future<void> _loadMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final mealsJson = prefs.getStringList(_storageKey) ?? [];

    _meals = mealsJson
        .map((json) => FoodItem.fromJson(jsonDecode(json)))
        .toList();

    // Sort by timestamp, newest first
    _meals.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    notifyListeners();
  }

  Future<void> addMeal(FoodItem meal) async {
    _meals.insert(0, meal); // Add to beginning of list
    await _saveMeals();
    notifyListeners();
  }

  Future<void> removeMeal(int index) async {
    _meals.removeAt(index);
    await _saveMeals();
    notifyListeners();
  }

  Future<void> _saveMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final mealsJson = _meals.map((meal) => jsonEncode(meal.toJson())).toList();
    await prefs.setStringList(_storageKey, mealsJson);
  }

  Future<void> clearMeals() async {
    _meals.clear();
    await _saveMeals();
    notifyListeners();
  }
}
