import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationsService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  /// The `initNotifications` function in Dart initializes notifications by requesting permission from
  /// Firebase Messaging.
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
  }
}
