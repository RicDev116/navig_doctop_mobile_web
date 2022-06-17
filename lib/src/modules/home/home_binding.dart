import 'package:get/get.dart';

import 'package:navigation_propuesta/src/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true
    );
  }
}