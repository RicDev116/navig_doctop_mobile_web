import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:navigation_propuesta/src/modules/home/home_controller.dart';
import 'package:navigation_propuesta/src/utils/responsive_widget.dart';
import 'package:navigation_propuesta/src/utils/screen.dart';

class HomePageMobile extends ResponsiveWidgetV2<HomeController> {

  HomePageMobile({
    Key? key
  }) : super(
    key: key,
    isHome: true,
    bodyDesktop: Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
        child: const Center(
          child: MyButtonText(),
        ),
      ),
    ),
    bodyMobile: Column(
      children: [
        SizedBox(height: Screen.percentHeight(12)),
        SizedBox(
          width: double.infinity,
          height: Screen.percentHeight(30),
          child: kIsWeb
          ?const MyScrollListView()
          :const MyListView(),
        ),
        SizedBox(height: Screen.percentHeight(2)),
        MyRow(),
        SizedBox(height: Screen.percentHeight(2)),
        MyRow(),
        SizedBox(height: Screen.percentHeight(2)),
        MyRow(),
      ],
    ),
  );
}

class MyScrollListView extends GetView<HomeController> {

  const MyScrollListView({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller.scrollController,
      child: const MyListView(),
    );
  }
}

class MyListView extends GetView<HomeController> {
  const MyListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller.scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: ((context, index) {
        return Container(
          margin: EdgeInsets.only(left: Screen.percentWidth(1)),
          color: Colors.green,
          width: Screen.percentWidth(80),
          height: Screen.percentHeight(20),
        );
      })
    );
  }
}



class MyButtonText extends GetView<HomeController> {
  const MyButtonText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.toNamed("/notifications"), 
      child: const Text("Notificaciones"),
    );
  }
}

class MyRow extends GetView<HomeController> {
  MyRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: Screen.percentHeight(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container( 
              color: Colors.black,
              width: Screen.percentWidth(45),
              height: Screen.percentHeight(12),
              child: const MyButtonText()
            ),
          ),
          SizedBox(width: Screen.percentWidth(1)),
          Expanded(
            child: Container(
              color: Colors.green,
              width: Screen.percentWidth(45),
              height: Screen.percentHeight(12),
            ),
          ), 
        ],
      ),
    );
  }
}