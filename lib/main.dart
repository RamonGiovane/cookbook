import 'dart:ui';
import 'package:cookbook/data/dummy_data.dart';
import 'package:cookbook/meals/app_routes.dart';
import 'package:cookbook/models/meal.dart';
import 'package:cookbook/screens/meal_detail_screen.dart';
import 'package:cookbook/screens/settings_screen.dart';
import 'package:cookbook/screens/tabs_screen.dart';
import 'models/settings.dart';
import 'screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;

  //Essa funcao vai mudar a lista de Meals que esta no estado do MyApp
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = _availableMeals.where((meal) {
        final filterGlutenFree = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactoseFree = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGlutenFree &&
            !filterLactoseFree &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
      print(settings);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinzar?',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
      },
    );
  }
}
