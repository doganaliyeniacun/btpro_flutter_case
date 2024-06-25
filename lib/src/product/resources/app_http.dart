// ignore_for_file: constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppHttp {
  static const String BASE_URL = 'https://omdbapi.com/';
  static String apiKey = dotenv.get('API_KEY');
  static  Map<String, String> baseQueryParameters = {'apikey': AppHttp.apiKey};
}
