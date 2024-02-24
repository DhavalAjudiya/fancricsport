// import 'dart:developer';
// import 'dart:async';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:yelowbus_attendantapp_flutter/helper/shared_preference.dart';
//
// Future<void> backgroundHandler(RemoteMessage message) async {
//   log("message received! ${message.notification!.title}");
// }
//
// FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
// final FirebaseMessaging messaging = FirebaseMessaging.instance;
//
// class NotificationService {
//   static Future<void> initialize() async {
//     AndroidInitializationSettings androidSettings =
//         const AndroidInitializationSettings("@mipmap/launcher_icon");
//
//     DarwinInitializationSettings iosSettings = const DarwinInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestCriticalPermission: true,
//         requestSoundPermission: true,
//         defaultPresentSound: true);
//
//     InitializationSettings initializationSettings =
//         InitializationSettings(android: androidSettings, iOS: iosSettings);
//
//     bool? initialized = await notificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: (response) {
//       log(response.payload.toString());
//     });
//     NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       String? token = await FirebaseMessaging.instance.getToken();
//       if (token != null) {
//         AppPreference.setString("fcmToken", token);
//       }
//
//       FirebaseMessaging.onBackgroundMessage(backgroundHandler);
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         print('Got a message whilst in the foreground!');
//         print('Message data: ${message.data}');
//
//         if (message.notification != null) {
//           print('Message also contained a notification: ${message.notification}');
//         }
//
//         // ExchangeHandler exchangeHandler = ExchangeHandler(mainContext);
//         // exchangeHandler.handleExchange(message);
//       });
//
//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//         print('Message data: ${message.data}');
//         if (message.data != null) {
//           log('message-----------   -:${message.data.toString()}:- N-----');
//
//           // message.
//         }
//         // ExchangeHandler exchangeHandler = ExchangeHandler(mainContext);
//         // exchangeHandler.handleExchange(message);
//       });
//       log("Notifications Initialized!");
//     }
//   }
// }
