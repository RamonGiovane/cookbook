import 'package:cookbook/meals/app_routes.dart';
import 'package:cookbook/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) => CategoriesMealsScreen(category)
    //   ),
    // );

    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),

      //cor ao clicar no botao
      splashColor: Theme.of(context).primaryColor,

      //raio da borda da area botao
      borderRadius: BorderRadius.circular(15),

      child: Container(
        // centralizando um pouco o texto
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),

        //aplicando uma borda ao item
        decoration: BoxDecoration(
          //raio da parte visual, da caixinha do item
          borderRadius: BorderRadius.circular(15),
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
      ),
    );
  }
}
