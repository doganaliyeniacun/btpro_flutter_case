import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);  

  /// The `logEvent` function logs an event with a specified name and parameters using an analytics
  /// service.
  /// 
  /// Args:
  ///   eventName (String): The `eventName` parameter is a required `String` that represents the name of
  /// the event to be logged.
  ///   parameters (Map<String, Object>): The `logEvent` function takes two required parameters:
  Future<void> logEvent({
    required String eventName,
    required Map<String, Object> parameters,
  }) async {
    await _analytics.logEvent(
      name: eventName,
      parameters: parameters,
    );
  }
}
