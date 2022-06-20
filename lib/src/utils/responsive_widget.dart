import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    final bool isSmallDevice = MediaQuery.of(context).size.width <= 650;
    final bool isBigDevice = MediaQuery.of(context).size.width > 650;


    print("Is movil device? " + isMobileDevice.toString());

    //TODO VERIFICA QUE LA RUTA ACTUAL SEA CONFIGURACION DE NOTIFICACIONES, PUESTO QUE EN DISEÑO DE FIGMA ESTA
    //PANTALLA EXISTE SOLO SI LA APLICACIÓN SE ESTA USANDO EN MOVIL
    if(Get.currentRoute == "/notifications/configuration" && (isWebDevice && isBigDevice) ){
      Get.back();
    }

    return SafeArea(
      child: Scaffold(
        appBar: isWebDevice && isBigDevice
          ?GenericDeskBar(
            isHome: isHome,
            title: title??"",
          )
          :isMobileDevice
            ?GenericAppBar(
              hasControllNavigation: true,
              title: title??"",
            )
            :isHome
              ?const PreferredSize(
                preferredSize: Size.zero,
                child: SizedBox()
              )
              :GenericAppBar(
                hasControllNavigation: (isWebDevice && isSmallDevice)?false:true,
                title: title??"",//Aquí se identifica que no va a haber navegación si es webdevice y smallDevice,
              ) as PreferredSizeWidget,
        
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
            return Container(
              color: Colors.green,
              child: body,
            );
          } 
        ),
      ),
    );
  }
}   




