import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_prefrences/providers/theme_provider.dart';
import 'package:user_prefrences/share_preferences/preferences.dart';
import 'package:user_prefrences/widgets/widgets.dart';

class SettingScreen extends StatefulWidget {
  static const String routerName = 'Settings';

  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // bool isDarkmode = false;
  // int gender = 1;
  // String name = 'Juan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const DrawerMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Ajustes',
                    style: TextStyle(fontSize: 25),
                  ),
                  const Divider(),
                  SwitchListTile.adaptive(
                      value: Preferences.isDarkmode,
                      title: const Text('Darmode'),
                      onChanged: (value) {
                        Preferences.isDarkmode = value;
                        final themeProvider =
                            Provider.of<ThemeProvider>(context, listen: false);

                        value
                            ? themeProvider.setDarkMode()
                            : themeProvider.setLightMode();
                            
                        setState(() {});
                      }),
                  const Divider(),
                  RadioListTile<int>(
                      value: 1,
                      title: const Text('Masculino'),
                      groupValue: Preferences.gender,
                      onChanged: (value) {
                        Preferences.gender = value ?? 1;
                        setState(() {});
                      }),
                  const Divider(),
                  RadioListTile<int>(
                      value: 2,
                      title: const Text('Femenino'),
                      groupValue: Preferences.gender,
                      onChanged: (value) {
                        Preferences.gender = value ?? 2;
                        setState(() {});
                      }),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        Preferences.name = value;
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          labelText: 'Nombre',
                          helperText: 'Nombre del usuario'),
                      initialValue: Preferences.name,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
