import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_propuesta/src/navigation/app_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Navigation example',
      initialRoute: "/home",
      getPages: AppPages.pages,
    );
  }
} 