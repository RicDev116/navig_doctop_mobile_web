import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:navigation_propuesta/src/modules/notifications/notifications_controller.dart';
import 'package:navigation_propuesta/src/utils/responsive_widget.dart';

class NotificationsConfigurationPage extends ResponsiveWidgetV2<NotificationsConfigurationPage> {

  NotificationsConfigurationPage({
    Key? key
  }) : super(
    key: key,
    bodyDesktop: const SizedBox(),
    bodyMobile: const NotificationConfigurationBody()
  );
}

class NotificationConfigurationBody extends GetView<NotificationsController> {

  const NotificationConfigurationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      id: "checkbox-list",
      builder: (_) => Column(
        children: List.generate(
          controller.checkBoxStatus.length, 
          (index) => CheckboxListTile(
            title: Text("Option $index"),
            value: controller.checkBoxStatus[index], 
            onChanged: (value) => controller.onChangeCheckboxItem(index),
          )
        )
      ),
    );
  }
}