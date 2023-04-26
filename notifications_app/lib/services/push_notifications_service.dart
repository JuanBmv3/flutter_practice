import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static String? token;

  static final StreamController<String> _streamController =
      StreamController.broadcast();

  static Stream<String> get streamController => _streamController.stream;
  static Future _backgoundHandler(RemoteMessage message) async {
    // print(message.messageId);
    
    _streamController.add(message.data['producto'] ?? ' No title');
  }

  static Future _onMesageHandler(RemoteMessage message) async {
    // print(message.messageId);
    
    _streamController.add(message.data['producto'] ?? ' No title');
  }

  static Future _onMesageOpenApp(RemoteMessage message) async {
    // print(message.messageId);
    _streamController.add(message.data['producto'] ?? ' No title');
  }

  static Future initializeApp() async {
    // Push notificacions

    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    FirebaseMessaging.onBackgroundMessage(_backgoundHandler);
    FirebaseMessaging.onMessage.listen(_onMesageHandler);
    FirebaseMessaging.onBackgroundMessage(_onMesageOpenApp);
  }

  static closeStreams() {
    _streamController.close();
  }
}
