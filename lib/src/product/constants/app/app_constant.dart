// ignore_for_file: constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstant {
  static const String BASE_URL = 'https://omdbapi.com';
  static String API_KEY = dotenv.get('API_KEY');
  static  Map<String, String> BASE_QUERY_PARAMETERS = {'apikey': API_KEY};
}
