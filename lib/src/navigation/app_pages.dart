
import 'package:get/get.dart';
import 'package:navigation_propuesta/src/modules/home/home_binding.dart';
import 'package:navigation_propuesta/src/modules/home/pages/home_page_mobile.dart';
import 'package:navigation_propuesta/src/modules/notifications/notifications_binding.dart';
import 'package:navigation_propuesta/src/modules/notifications/pages/notifications_page_mobile.dart';

class AppPages{

  AppPages._();

  static final pages = [

    //=====Principal pages=====
    GetPage(
      name: "/home", 
      page: () => HomePageMobile(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: "/notifications", 
      page: () => NotificationsPageMobile(),
      binding: NotificationsBinding(),
    ),
//     GetPage(
//       name: "/notifications/configuration",
//       page: () => NotificationsConfigurationPage(),
// ¿    ),
//     GetPage(
//       name: "/payments", 
//       page: () => PaymentsPage(),
//       binding: PaymentsBindingBinding(),
//     ),

    
  ];

}