import 'package:app_news/screens/tabs_screen.dart';
import 'package:app_news/services/news_service.dart';
import 'package:app_news/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:  [
        ChangeNotifierProvider(create: ( _ ) => NewsService())
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: const TabsScreen(),
        theme: theme,
          
        
      ),
    );
  }
}