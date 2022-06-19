//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenericDeskBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Color titleColor;
  final bool isLeading;
  Function()? backButton;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color backButtonColor;

  GenericDeskBar(
      {Key? key,
      this.title = "",
      this.titleColor = Colors.black,
      this.isLeading = true,
      this.backButton,
      this.subtitle,
      this.actions,
      this.backgroundColor = Colors.white,
      this.backButtonColor = Colors.black,
      })
      : super(key: key);

  final String? subtitle;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    backButton ??= () {
      Get.back(result: false);  
    };

    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const[
              Icon(Icons.home),
              Text("SDC"),
              Text('.'),
              Text('Residencial'),
            ],
          ),
          Container(
            color: Colors.blueGrey,
            child: Row(
              children: [
                const Icon(Icons.face),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Si recibo visitas'),
                    Text('presiona para restringir visitas'),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: const[
              Icon(Icons.sos),
              Icon(Icons.message),
              Icon(Icons.notifications),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text("Esteban Arriaga"),
                  Text("Calle Estrellas #34"),
                ],
              ),
              const Icon(Icons.message),
              const Icon(Icons.notifications),
            ],
          ),
        ],
      ),
      // Row(
      //   children: [
      //     Icon(Icons.home),
      //     Text("SDC"),
      //     Text("."),
      //     Text('Residencial'),
      //   ],
      // ),
      // leading: Row(
      //   children: [
      //     Icon(Icons.home),
      //     Text('SDC'),
      //     Text('.'),
      //     Text('Residencial'),
      //   ],
      // ),
      // leadingWidth: !isLeading ? 0 : null,
      backgroundColor: Colors.blue,
      actions: actions,

    );
  }
}
