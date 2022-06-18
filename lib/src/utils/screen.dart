import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen{

  static double percentWidth(double valor) {
    final size = MediaQuery.of(Get.context!).size;
    return ((size.width / 100) * valor);
  }

  static double percentHeight(double valor) {
    final size = MediaQuery.of(Get.context!).size;
    return ((size.height / 100) * valor);
  }

  static double rectiveSize(double valor) {
    final size = MediaQuery.of( Get.context!).size;
    final a = ((size.aspectRatio)*valor);
    print(a.toString());
    return a;
  }
}