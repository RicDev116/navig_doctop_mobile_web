import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_propuesta/src/modules/notifications/notifications_controller.dart';
import 'package:navigation_propuesta/src/utils/responsive_widget.dart';

class NotificationsPageMobile extends ResponsiveWidgetV2<NotificationsController> {

  NotificationsPageMobile({
    Key? key
  }) : super(
    key: key,
    title: "Notificaciones",
    bodyDesktop: const NotificatioBodynDesktop(), 
    bodyMobile: Container(
      color: Colors.red,
      child: Center(
        child:TextButton(
          onPressed:  () => Get.toNamed("/notifications/configuration"), 
          child: const Text("Configuracion"),
        ),
      ),
    ),
  );
}


class NotificatioBodynDesktop extends StatelessWidget {
  const NotificatioBodynDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            // color: Colors.red,
            child: DropdownButton(
              icon: const Icon(Icons.settings),
              items: const[
                DropdownMenuItem(
                  child: Text('Chi'),
                  value: 0,
                ),
                DropdownMenuItem(
                  child: Text('Ño'),
                  value: 1, 
                )
              ], 
              onChanged: (i) => print("On changed $i"),
            )
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        )
      ],
    );
  }
}

