import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

class FoodService extends ChangeNotifier {
  // Mock data - we'll always return Pizza to match the mockup
  final String _defaultFood = "Pizza";
  final double _defaultCalories = 169.52;

  // Food emoji mapping
  final Map<String, String> _foodEmojiMap = {
    'Pizza': '🍕',
    'Burger': '🍔',
    'Salad': '🥗',
    'Pasta': '🍝',
    'Ice Cream': '🍦',
  };

  List<String> get availableFoods => [_defaultFood];

  String getEmojiForFood(String foodName) {
    return _foodEmojiMap[foodName] ?? '🍽️';
  }

  Future<String> identifyFood(File imageFile) async {
    // We'll always return Pizza for the mockup
    await Future.delayed(const Duration(milliseconds: 700)); // Simulate processing
    return _defaultFood;
  }

  Future<double> getCaloriesPer100g(String foodName) async {
    // Simulate a brief delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _defaultCalories;
  }

  Future<double> estimateCalories(String foodName, double portionSize) async {
    final caloriesPer100g = await getCaloriesPer100g(foodName);
    return caloriesPer100g * (portionSize / 100);
  }
}