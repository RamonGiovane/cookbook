import 'package:cookbook/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      // centralizando um pouco o texto
      padding: const EdgeInsets.all(15),
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.headline6,
      ),

      //aplicando uma borda ao item
      decoration: BoxDecoration(
        //aplicando uma cor gradiente ao item
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.5),
            category.color.withOpacity(1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
