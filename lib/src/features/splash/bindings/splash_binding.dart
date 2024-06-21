import 'package:btpro_flutter_case/src/features/splash/view_model/splash_view_model.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashViewModel>(
      SplashViewModel(),
    );
  }
}
