import 'package:btpro_flutter_case/app.dart';
import 'package:btpro_flutter_case/src/product/init/app_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await AppInit.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}
