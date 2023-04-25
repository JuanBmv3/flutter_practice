import 'package:flutter/material.dart';
import 'package:user_prefrences/widgets/widgets.dart';

import '../share_preferences/preferences.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'Home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const DrawerMenu(),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkmode: ${Preferences.isDarkmode} '),
          
          const Divider(),

          Text('Genero: ${Preferences.gender == 1 ? 'Masculino' : 'Femenino'} '),

          const Divider(),
          
          Text('Nombre: ${Preferences.name} '),
          
        ],
      ),
    );
  }
}
