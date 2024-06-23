import 'package:firebase_analytics/firebase_analytics.dart';

import '../../../../features/movie/model/movie.dart';

class AnalyticsService {
  late final FirebaseAnalytics analytics;

  AnalyticsService() {
    analytics = FirebaseAnalytics.instance;
  }

  void logMovieEvent(Movie movie) async {
    Map<String, dynamic> dynamicMap = movie.toJson();
    Map<String, Object> objectMap = dynamicMap.map((key, value) => MapEntry(key, value ?? '' as Object));

    await analytics.logEvent(
      name: 'movie_event',
      parameters: objectMap,
    );
  }
}
