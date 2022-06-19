import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_propuesta/src/widgets/generic_app_bar.dart';
import 'package:navigation_propuesta/src/widgets/generic_desktop_bar.dart';

// import '../widgets/generic_app_bar.dart';


// abstract class ResponsiveWidget<T> extends GetView<T> {

//   const ResponsiveWidget({
//     Key? key,
//   }) : super(key: key);

//   //TODO AGRAGAR BARRA DE ARRIBA EN WEB AQUI



//   Widget buildMobile(BuildContext context, double maxWidth);
//   Widget buildDesktop(BuildContext context, double maxWidth);

//   @override
//   Widget build(BuildContext context) {

//     Get.find<T>;

//     const bool deviceIsWeb = kIsWeb;

//     return LayoutBuilder(builder: (context, constraints) {

//       final bool isSmallDevice = constraints.maxWidth <= 900;

//       if (deviceIsWeb && isSmallDevice) {
//         return buildMobile(context, constraints.maxWidth);
//       } else if(deviceIsWeb && isSmallDevice){
//         return buildDesktop(context, constraints.maxWidth);
//       }
//     });
//   }
// }


abstract class ResponsiveWidgetV2<T> extends GetView<T> {

  ResponsiveWidgetV2({
    Key? key, 
    required this.bodyMobile,
    required this.bodyDesktop,
  }) : super(key: key);

  final Widget bodyMobile;
  final Widget bodyDesktop;
  
  static const bool isMobileDevice = !kIsWeb;
  static const bool isWebDevice = kIsWeb;
  final bool isSmallDevice = MediaQuery.of(Get.context!).size.width <= 900;
  final bool isBigDevice = MediaQuery.of(Get.context!).size.width > 900;



  @override
  Widget build(BuildContext context) {

    Get.find<T>;

    const bool isMobileDevice = !kIsWeb;
    const bool isWebDevice = kIsWeb;
    final bool isSmallDevice = MediaQuery.of(context).size.width <= 900;
    final bool isBigDevice = MediaQuery.of(context).size.width > 900;

    print("Device is movil? " + isMobileDevice.toString());

    return SafeArea(
      child: Scaffold(
        appBar: isMobileDevice
        ?GenericAppBar(
          hasControllNavigation: (isWebDevice && isSmallDevice)?false:true,//Aquí se identifica que no va a haber navegación si es webdevice y smallDevice
        )
        :GenericDeskBar() as PreferredSizeWidget,
        body: Builder(
          builder: (context){
            late Widget body;
            if(isWebDevice && isBigDevice){
              body = bodyDesktop;
            }
            if(isMobileDevice){
              body = bodyMobile;
            }
            if(isWebDevice && isSmallDevice){
              body = bodyMobile; //TODO WITHOUT NAVIGATION
            }
            return body;
          } 
        ),
      ),
    );
  }
}




