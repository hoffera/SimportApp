import "package:firebase_core/firebase_core.dart";
import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class NotificationService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> localNotInit() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    final DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
          notificationCategories: [
            DarwinNotificationCategory(
              "demoCategory",
              actions: <DarwinNotificationAction>[
                DarwinNotificationAction.plain("id_1", "Action 1"),
                DarwinNotificationAction.plain(
                  "id_2",
                  "Action 2",
                  options: <DarwinNotificationActionOption>{
                    DarwinNotificationActionOption.destructive,
                  },
                ),
                DarwinNotificationAction.plain(
                  "id_3",
                  "Action 3",
                  options: <DarwinNotificationActionOption>{
                    DarwinNotificationActionOption.foreground,
                  },
                ),
              ],
            ),
          ],
        );

    final LinuxInitializationSettings linuxSettings =
        LinuxInitializationSettings(defaultActionName: "Open notification");

    final InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
      linux: linuxSettings,
    );

    _flutterLocalNotificationPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    await _flutterLocalNotificationPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: onNotificationTap,
    );
  }

  static Future<void> init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    final token = await _firebaseMessaging.getToken();
    print("Device token: $token");

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("🚀 Mensagem aberta: ${message.data}");
    });

    // Mensagens em segundo plano
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static void onNotificationTap(NotificationResponse response) {
    final payload = response.payload;
    print("🎯 Notificação tocada! Payload: $payload");
  }
}
