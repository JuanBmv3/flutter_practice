import 'package:flutter/material.dart';
import 'package:user_prefrences/screens/home_screen.dart';
import 'package:user_prefrences/screens/settings_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
              leading: const Icon(Icons.pages_outlined),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, HomeScreen.routerName);
              }),
          ListTile(
              leading: const Icon(Icons.people_outline_outlined),
              title: const Text('People'),
              onTap: () {}),
          ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {
           
                Navigator.pushReplacementNamed(context, SettingScreen.routerName);
              })
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
      child: Container(),
    );
  }
}
