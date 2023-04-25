import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_prefrences/providers/theme_provider.dart';
import 'package:user_prefrences/screens/screens.dart';
import 'package:user_prefrences/share_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
      ],
     child: const MyApp()
    ),
   
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (_) => const HomeScreen(),
        SettingScreen.routerName: (_) => const SettingScreen()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme
    );
  }
}
