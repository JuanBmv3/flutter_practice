import 'package:flutter/material.dart';
import 'package:notifications_app/screens/screens.dart';
import 'package:notifications_app/services/push_notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messegerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    

    //context

    PushNotificationsService.streamController.listen(
      (message) {
        // print('MyApp: $message');
        navigatorKey.currentState?.pushNamed('message', arguments: message);
        final snackBar = SnackBar(content: Text(message));
        messegerKey.currentState?.showSnackBar(snackBar);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messegerKey,
      routes: {
        'home': (_) => const HomeScreen(),
        'message': (_) => const MessageScreen(),
      },
    );
  }
}
