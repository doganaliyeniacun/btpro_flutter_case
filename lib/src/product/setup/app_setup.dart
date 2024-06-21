import 'package:btpro_flutter_case/src/product/network/network_controller.dart';
import 'package:get/get.dart';

class AppSetup {
  static void  init(){
    Get.put<NetworkController>(NetworkController(),permanent: true);
  }
}