import 'package:flutter/cupertino.dart';

class CategoriesScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, //extensão de cada elemento
        childAspectRatio: 3/2, //proporção de cada elemento
        crossAxisSpacing: 20, // espaçamento no eixo x
        mainAxisSpacing: 20, // espaçamento no eixo y
        
    ),
    children: <Widget>[
      
    ],
    );
  }
  
}