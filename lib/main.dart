import 'package:btpro_flutter_case/app.dart';
import 'package:btpro_flutter_case/src/product/resources/app_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await AppSetup.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}
