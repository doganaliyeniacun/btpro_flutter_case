import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../firebase_options.dart';
import '../firebase/remote_config/remote_config_service.dart';
import '../network/network_controller.dart';

class AppSetup {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    //firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Dependency injections
    Get.put(NetworkController(), permanent: true);
    Get.put(RemoteConfigService(), permanent: true);

    
  }
}
