import 'package:cookbook/components/main_drawer.dart';
import 'package:cookbook/models/meal.dart';
import 'package:cookbook/screens/categories_screen.dart';
import 'package:cookbook/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': CategoriesScreen.screenName, 'screen': CategoriesScreen()},
      {
        'title': FavoritesScreen.screenName,
        'screen': FavoritesScreen(widget.favoriteMeals)
      },
    ];
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text((_screens[_selectedScreenIndex]['title'])), //yeah, this sucks
      ),

      drawer: MainDrawer(),

      //O corpo do Scaffold será a tela selecionada
      body: _screens[_selectedScreenIndex]['screen'],

      bottomNavigationBar: BottomNavigationBar(
        /*Ao clicar numa aba, a função _selectScreen é chamada passando o indice 
        * da tela. Na função _selectScreen o indice é alterado no estado 
        * do Widget.*/
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categorias'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favoritos'),
          ),
        ],
      ),
    );
  }
}
