import 'package:firebase_analytics/firebase_analytics.dart';

abstract class IAnalyticsService {
  FirebaseAnalyticsObserver getAnalyticsObserver();
  Future<void> logEvent({
    required String eventName,
    required Map<String, Object> parameters,
  });
}
