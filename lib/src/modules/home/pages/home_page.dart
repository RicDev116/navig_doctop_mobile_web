import 'package:flutter/material.dart';
import 'package:navigation_propuesta/src/utils/responsive_widget.dart';
import 'package:navigation_propuesta/src/utils/screen.dart';

class HomePageMobile extends ResponsiveWidgetV2 {

  HomePageMobile({
    Key? key
  }) : super(
    key: key,
    body: SafeArea(
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
            const MyRow(),
            SizedBox(height: Screen.percentHeight(2)),
            const MyRow(),
            SizedBox(height: Screen.percentHeight(2)),
            const MyRow(),
          ],
        ),
      ),
    )
  );
}

class MyRow extends StatelessWidget {
  const MyRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          color: Colors.black,
          width: Screen.percentWidth(45),
          height: Screen.percentHeight(12),
        ),
        Container(
          color: Colors.black,
          width: Screen.percentWidth(45),
          height: Screen.percentHeight(12),
        ), 
      ],
    );
  }
}