import 'package:flutter/material.dart';
import 'package:navigation_propuesta/src/modules/notifications/notifications_controller.dart';
import 'package:navigation_propuesta/src/utils/responsive_widget.dart';

class NotificationsPageMobile extends ResponsiveWidgetV2<NotificationsController> {

  NotificationsPageMobile({
    Key? key
  }) : super(
    key: key,
    bodyDesktop: const NotificatioBodynDesktop(), 
    bodyMobile: Container(color: Colors.red),
  );
}


class NotificatioBodynDesktop extends StatelessWidget {
  const NotificatioBodynDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          )
        ],
      )
    );
  }
}

