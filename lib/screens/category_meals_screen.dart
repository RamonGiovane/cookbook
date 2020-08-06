import 'package:cookbook/components/meal_item.dart';
import 'package:cookbook/data/dummy_data.dart';
import 'package:cookbook/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //pegando uma category da rota
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => MealItem(categoryMeals[index]),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
