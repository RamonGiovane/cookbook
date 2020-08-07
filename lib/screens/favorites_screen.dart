import 'package:cookbook/components/meal_item.dart';
import 'package:cookbook/models/meal.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals);

  static const String screenName = 'Meus Favoritos';

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty)
      return Center(
        child: Text('Nenhuma refeição marcada como favorita ainda'),
      );
    else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index){
          return MealItem(favoriteMeals[index]);
        },  
      );
    }
  }
}
