import 'package:cookbook/components/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Settings settings;

  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  Settings settings;

  @override
  initState(){
    super.initState();
     settings = widget.settings; //Pegando as settings que vieram do Widget acima
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
         
           //Aqui mudará o estado do objeto Settings dessa classe
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem Glúten',
                  'Exbir apenas comidas sem glúten',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),

                 _createSwitch(
                  'Sem Lactose',
                  'Exbir apenas comidas sem lactose',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),

                 _createSwitch(
                  'Vegano',
                  'Exbir apenas comidas veganas',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),

                 _createSwitch(
                  'Vegetariano',
                  'Exbir apenas comidas vegetarianas',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
