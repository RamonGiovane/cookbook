import 'package:cookbook/components/meal_item.dart';
import 'package:cookbook/models/category.dart';
import 'package:cookbook/models/meal.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  
 final List<Meal> meals;

 const CategoriesMealsScreen(this.meals); 
  
  @override
  Widget build(BuildContext context) {
    //pegando uma category da rota
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = meals
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
