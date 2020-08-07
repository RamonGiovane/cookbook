import 'package:cookbook/meals/app_routes.dart';
import 'package:cookbook/models/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  void _selectMeal(BuildContext context) async{
   Object a  = await Future.microtask(() => 
   Navigator.of(context).pushNamed(
      AppRoutes.MEAL_DETAIL,
      arguments: meal,
    ));

    print(a);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>_selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //Na pilha ficarão a imagem e o nome do prato
            Stack(
              children: <Widget>[
                //Imagem
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                //Nome do Prato
                Positioned(
                  //so funciona no contexto da Stack, serve para ancorar o item dentro da pilha
                  right: 10, // posicao em que o texto
                  bottom: 20, // ira ficar na pilha
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),

            //Dentro do padding ficarão as infos de preparo
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                //Uma row para conter todas as informações
                children: <Widget>[
                  Row(
                    //Uma row para a duração
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ), //pequeno espaço entre icone de relogio e texto
                      Text('${meal.duration} min'),
                    ],
                  ),

                  //Uma row para a dificuldade
                  Row(
                    children: <Widget>[
                      Icon(Icons.stars),
                      SizedBox(
                        width: 6,
                      ),
                      Text(meal.complexityString),
                    ],
                  ),

                  //Uma row para o custo
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(meal.costString),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
