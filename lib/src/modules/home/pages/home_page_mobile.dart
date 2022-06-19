import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_propuesta/src/utils/responsive_widget.dart';
import 'package:navigation_propuesta/src/utils/screen.dart';

class HomePageMobile extends ResponsiveWidgetV2 {

  HomePageMobile({
    Key? key
  }) : super(
    key: key,
    bodyDesktop: Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
        child: Center(
          child: TextButton(
            onPressed: () => Get.toNamed("/notifications"), 
            child: const Text("Notificaciones"),
          ),
        ),
      ),
    ),
    bodyMobile: SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: Screen.percentHeight(12)),
            SizedBox(
              width: double.infinity,
              height: Screen.percentHeight(30),
              child: ListView.builder(
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
              ),
            ),
            SizedBox(height: Screen.percentHeight(2)),
            MyRow(),
            SizedBox(height: Screen.percentHeight(2)),
            MyRow(),
            SizedBox(height: Screen.percentHeight(2)),
            MyRow(),
          ],
        ),
      ),
    )
  );
}

class MyRow extends StatelessWidget {
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