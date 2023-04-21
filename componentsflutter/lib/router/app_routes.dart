import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'listView',
        icon: Icons.list,
        name: 'List View',
        screen: const ListViewScreen()),
    MenuOption(
        route: 'alert',
        icon: Icons.warning,
        name: 'Alerts Screen',
        screen: const AlertScreen()),
    MenuOption(
        route: 'card',
        icon: Icons.square,
        name: 'Cards Screen',
        screen: const CardScreen()),
    MenuOption(
        route: 'avatar',
        icon: Icons.photo,
        name: 'Avatar Screen',
        screen: const AvatarScreen()),
    MenuOption(
        route: 'animeted',
        icon: Icons.animation,
        name: 'Animeted Screen',
        screen: const AnimatedScreen()),
    MenuOption(
        route: 'inputs',
        icon: Icons.label,
        name: 'Inputs Screen',
        screen: const InputsScreen()),
      MenuOption(
        route: 'slider',
        icon: Icons.line_weight,
        name: 'Slider Screen',
        screen: const SliderScreen()),
      MenuOption(
        route: 'listbuild',
        icon: Icons.settings,
        name: 'List Build Screen',
        screen: const ListBuildScreen())
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
