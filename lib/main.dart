import 'package:btpro_flutter_case/app.dart';
import 'package:btpro_flutter_case/src/product/resources/app_setup.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppSetup.init();
  runApp(const MyApp());
}



