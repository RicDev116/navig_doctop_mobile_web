import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/generic_app_bar.dart';


abstract class ResponsiveWidget<T> extends GetView<T> {

  const ResponsiveWidget({
    Key? key,
  }) : super(key: key);

  //TODO AGRAGAR BARRA DE ARRIBA EN WEB AQUI



  Widget buildMobile(BuildContext context, double maxWidth);
  Widget buildDesktop(BuildContext context, double maxWidth);

  @override
  Widget build(BuildContext context) {

    Get.find<T>;

    const bool deviceIsWeb = kIsWeb;

    return LayoutBuilder(builder: (context, constraints) {

      final bool isSmallDevice = constraints.maxWidth <= 900;

      if (deviceIsWeb && isSmallDevice) {
        return buildMobile(context, constraints.maxWidth);
      } else if(deviceIsWeb && isSmallDevice){
        return buildDesktop(context, constraints.maxWidth);
      }
    });
  }
}


abstract class ResponsiveWidgetV2<T> extends GetView<T> {

  const ResponsiveWidgetV2({
    Key? key,
    required this.bodyMobile,
    required this.bodyDesktop,
  }) : super(key: key);

  final bodyMobile;
  final Widget bodyDesktop;

  //TODO AGRAGAR BARRA DE ARRIBA EN WEB AQUI


  @override
  Widget build(BuildContext context) {

    Get.find<T>;

    const bool deviceIsDesktop = kIsWeb;

    return Scaffold(
      appBar: GenericAppBarMobile(),
      body: deviceIsDesktop
      ?bodyDesktop
      :bodyMobile,
    );
  }
}




