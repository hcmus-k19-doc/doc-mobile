import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app/app/main.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotificationService {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _androidChannel = const AndroidNotificationChannel(
      "doc_noti_channel", "DOC Noti Channel",
      description: "This channel is for doc notification",
      importance: Importance.defaultImportance);
  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@drawable/logo_noti',
          )),
          payload: jsonEncode(message.toMap()));
    });
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    initPushNotification();
    initLocalNotification();
  }

  Future<String?> getFirebaseToken() async {
    return await _firebaseMessaging.getToken();
  }

  Future<void> revokeFirebaseToken() async {
    await _firebaseMessaging.deleteToken();
  }

  Future initLocalNotification() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/logo_noti');
    const settings = InitializationSettings(android: android, iOS: iOS);
    await _localNotifications.initialize(settings,
        onDidReceiveNotificationResponse: (notificationReponse) {
      final message = RemoteMessage.fromMap(
          jsonDecode(notificationReponse.payload ?? "{}"));
      handleMessage(message);
    });
    final platForm = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platForm?.createNotificationChannel(_androidChannel);
  }
}

void handleMessage(RemoteMessage? message) {
  if (message == null) return;
  try {
    String? documentType = message.data["processingDocumentType"];
    String? documentId = message.data["documentId"];
    if (documentType != null && documentId != null) {
      int docId = int.parse(documentId);
      navigatorKey.currentState?.pushNamed(
          documentType == "INCOMING_DOCUMENT"
              ? MyRouter.incomingDocumentDetail
              : MyRouter.outgoingDocumentDetail,
          arguments: DocumentDetailArgs(documentId: docId));
    }
  } catch (error) {
    print(error);
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
  print("image: ${message.notification?.android?.imageUrl}");
  print("Payload: ${message.data}");
}
