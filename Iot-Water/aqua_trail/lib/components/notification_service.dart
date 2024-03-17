import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/timezone.dart' as tz;
import 'dart:convert';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final workmanager = Workmanager();
final notificationService = NotificationService();

void callbackDispatcher() {
  flutterLocalNotificationsPlugin.show(
    0, // Notification ID (optional)
    null,
    'This is a reminder from your app!',
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'your_channel_id',
        'Important Updates', // Channel name (visible to user)
        channelDescription:
            '🍸Stay Hydrated!🥛Drink water itss too long since you last drank.', // Channel description (visible to user)
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'Flutter Notification',
      ),
      // iOS: IOSNotificationDetails(),
    ),
  );
  print("NOtify started");
}

class NotificationService {
  Future<void> initializeNotifications() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      null, // No title
      'Stay Hydrated!Drink water itss too long since you last drank.', // Description as body
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'your_channel_id',
          'Important Updates', // Channel name (visible to user)
          channelDescription:
              '🍸Stay Hydrated!🥛Drink water itss too long since you last drank.', // Channel description (visible to user)
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'Flutter Notification',
        ),
        // iOS: IOSNotificationDetails(),
      ),
      payload: jsonEncode({
        'scheduledTime': DateTime.now().add(const Duration(minutes: 5))
      }), // Encode scheduled time
      // ... (rest of notification details)

      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
    );

    // workmanager.initialize(
    //   callbackDispatcher, // Callback function to handle work
    //   isInDebugMode: true, // Optional for debugging
    // );

    // workmanager.registerPeriodicTask(
    //   "10-minute-notification", // Unique task name
    //   "backgroundTask", // Task name for logging
    //   frequency: Duration(seconds: 30), // Frequency (minimum 15 minutes)
    // );
  }
}
