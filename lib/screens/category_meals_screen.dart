import 'package:cookbook/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {

 @override
  Widget build(BuildContext context) {

    //pegando uma category da rota 
    final category = ModalRoute.of(context).settings.arguments as Category ;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas'),
      ),
      body: Center(
        child: Text('Receitas por Categoria ${category.title}'),
      ),
    );
  }
}
