import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationsService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
  }
}
