import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart';

import 'package:navigation_propuesta/src/widgets/generic_app_bar.dart';
import 'package:navigation_propuesta/src/widgets/generic_desktop_bar.dart';

abstract class ResponsiveWidgetV2<T> extends GetView<T> {

  ResponsiveWidgetV2({
    Key? key, 
    this.title,
    required this.bodyMobile,
    required this.bodyDesktop,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.isHome = false,
  }) : super(key: key);

  final String? title;
  final MainAxisAlignment mainAxisAlignment;
  final Widget bodyMobile;
  final Widget bodyDesktop;
  final bool isHome;


  @override
  Widget build(BuildContext context) {

    Get.find<T>;

    const bool isMobileDevice = !kIsWeb;
    const bool isWebDevice = kIsWeb;

    final bool isSmallDevice = MediaQuery.of(context).size.width <= 750;
    final bool isBigDevice = MediaQuery.of(context).size.width > 750;

    bool? screenIsLessThanOrEqualToHalf;
    bool? screenIsLargerThanHalf;

    if(isWebDevice){
      screenIsLessThanOrEqualToHalf = MediaQuery.of(context).size.width <= (window.screen!.width!.toDouble() / 2);
      screenIsLargerThanHalf =  MediaQuery.of(context).size.width > (window.screen!.width!.toDouble() / 2);
    }

    print("Is movil device? " + isMobileDevice.toString());

    //TODO VERIFICA QUE LA RUTA ACTUAL SEA CONFIGURACION DE NOTIFICACIONES, PUESTO QUE EN DISEÑO DE FIGMA ESTA
    //PANTALLA EXISTE SOLO SI LA APLICACIÓN SE ESTA USANDO EN MOVIL
    if(Get.currentRoute == "/notifications/configuration" && (isWebDevice && isBigDevice) ){
      Get.back();
    }

    return SafeArea(
      child: Scaffold(
        appBar: SelectContent().selectTypeAppBar(isHome, title),
        body: Builder(
          builder: (context){

            late Widget body;

            if(isMobileDevice){ 
              body = bodyMobile;
            }

            if(isWebDevice){
              if(screenIsLargerThanHalf!){
                body = bodyDesktop;
              }else if(screenIsLessThanOrEqualToHalf!){
                body = bodyMobile;
              }
            }

            return Container(
              child: body,
            );
          } 
        ),
      ),
    );
  }
}   

class SelectContent{





  static const bool _isMobileDevice = !kIsWeb;
  static const bool _isWebDevice = kIsWeb;



  final bool _isSmallDevice = MediaQuery.of(Get.context!).size.width <= 750;
  final bool _isBigDevice = MediaQuery.of(Get.context!).size.width > 750;

  

  bool? screenIsLessThanOrEqualToHalf = MediaQuery.of(Get.context!).size.width <= (window.screen!.width!.toDouble() / 2);
  bool? screenIsLargerThanHalf= MediaQuery.of(Get.context!).size.width > (window.screen!.width!.toDouble() / 2);




  PreferredSizeWidget selectTypeAppBar(bool isHome, String? title){

    late PreferredSizeWidget appBar;

    if(_isMobileDevice){

      if(isHome){
        appBar = const PreferredSize(
          preferredSize: Size.zero,
          child: SizedBox()
        );
      }else{
        appBar = GenericAppBar(
          hasControllNavigation: true,
          title: title??"",
        );
      }

    }else if(_isWebDevice){

      if(screenIsLargerThanHalf!){
        appBar = GenericDeskBar(
          isHome: isHome,
          title: title??"",
        );
      }else if(_isSmallDevice){
        if(isHome){
          appBar = const PreferredSize(
            preferredSize: Size.zero,
            child: SizedBox()
          );
        }else{
          appBar = GenericAppBar(
            hasControllNavigation: false,
            title: title??"",
          );
        }
      }

    }
    return appBar;
  }








}




