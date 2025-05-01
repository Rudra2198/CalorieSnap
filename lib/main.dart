import 'package:flutter/material.dart';
import 'package:calorie_snap/screens/home_screen.dart';
import 'package:calorie_snap/services/food_service.dart';
import 'package:calorie_snap/services/meal_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services
  final foodService = FoodService();

  final mealService = MealService();
  await mealService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => foodService),
        ChangeNotifierProvider(create: (_) => mealService),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Snap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF4ECDC4),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF4ECDC4),
          secondary: const Color(0xFF6C63FF),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8E8),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF333333)),
          bodyMedium: TextStyle(color: Color(0xFF666666)),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}