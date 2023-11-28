// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:unlockway/constants.dart';

class FirebaseApi {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    fcmToken = await messaging.getToken();

    // Listen to events
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("\nNOTIFICATION\n\n");
      // print("Title: ${message.notification?.title}");
      // print("body: ${message.notification?.body}");
      // print("Payload: ${message.data}");
    });
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("\nBACKGROUND NOTIFICATION\n\n");
  // print("Title: ${message.notification?.title}");
  // print("body: ${message.notification?.body}");
  // print("Payload: ${message.data}");
}
