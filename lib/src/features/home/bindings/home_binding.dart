import 'package:btpro_flutter_case/src/features/home/view_model/home_view_model.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeViewModel>(
      HomeViewModel(),
    );
  }
}
