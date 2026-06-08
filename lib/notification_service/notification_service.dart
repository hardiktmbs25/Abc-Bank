import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin notification =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings androidSetting =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings settings = InitializationSettings(
      android: androidSetting,
    );
    await notification.initialize(
      settings,
      onDidReceiveNotificationResponse: (responce) {
        print("Notification Clicked : ${responce.payload}");
      },
    );
  }

  static Future<void> requestPermission() async {
    final AndroidPlugin = await notification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    if (AndroidPlugin != null) {
      await AndroidPlugin.requestNotificationsPermission();
    }
  }

  static Future<void> showNotification({
    required String action,
    required String title,
    required String message,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'main_channel',
          'main_channel_notification',
          channelDescription: "App Notification",
          importance: Importance.high,
          priority: Priority.high,
          playSound: true,
        );
    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
    );
    await notification.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      message,
      details,
      payload: payload,
    );
  }

  static Future<void> showCurdNotification({
    required String title,
    required String body,
  }) async {
      AndroidNotificationDetails demo = AndroidNotificationDetails(
      "curd_id",
      "curd_channel",
      importance: Importance.high,
      priority: Priority.high,
      styleInformation: BigTextStyleInformation(body),
    );
      final NotificationDetails notificationDetails = NotificationDetails(android: demo);
      await notification.show(DateTime.now().millisecondsSinceEpoch~/1000, title, body, notificationDetails);
  }
}
