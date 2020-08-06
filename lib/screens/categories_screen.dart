import 'package:cookbook/components/category_item.dart';
import 'package:cookbook/data/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        //add espaço entre as categorias
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //extensão de cada elemento
          childAspectRatio: 3 / 2, //proporção de cada elemento
          crossAxisSpacing: 20, // espaçamento no eixo x
          mainAxisSpacing: 20, // espaçamento no eixo y
        ),
        children: DUMMY_CATEGORIES.map((e) => 
        CategoryItem(e)).toList(),
    );
  }
}
