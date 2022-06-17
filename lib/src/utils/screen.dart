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

  static double horizontalPadding(context, double value) {
    return MediaQuery.of(context).size.width / value;
  }

  static double verticalPadding(context, double value) {
    return MediaQuery.of(context).size.height / value;
  }

  static bool getDeviceSize(BuildContext context, int desiredSize, bool isLower) {

    final size = MediaQuery.of(context).size;
    final screenSizes = [882.7272338867188 , 900, 1000, 1150, 1800];

    if (isLower) {
      if (size.width < screenSizes[desiredSize]) {
        return true;
      }
    } else {
      if (size.width > screenSizes[desiredSize]) {
        return true;
      }
    }

    return false;
  }


}