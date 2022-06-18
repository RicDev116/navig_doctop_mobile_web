import 'package:get/get.dart';
import 'package:navigation_propuesta/src/modules/notifications/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(),
      fenix: true
    );
  }
}