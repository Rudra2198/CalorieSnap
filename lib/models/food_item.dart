import 'package:intl/intl.dart';

class FoodItem {
  final String name;
  final double calories;
  final double portionSize;
  final DateTime timestamp;

  FoodItem({
    required this.name,
    required this.calories,
    required this.portionSize,
    required this.timestamp,
  });

  String get formattedTime => DateFormat.jm().format(timestamp);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'calories': calories,
      'portionSize': portionSize,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      name: json['name'] as String,
      calories: json['calories'] as double,
      portionSize: json['portionSize'] as double,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}