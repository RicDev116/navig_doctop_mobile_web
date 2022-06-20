//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:navigation_propuesta/src/utils/screen.dart';

class GenericDeskBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final bool isHome;

  GenericDeskBar(
    {Key? key,
    this.title = "",
    this.titleColor = Colors.black,
    this.backgroundColor = const Color.fromARGB(255, 65, 33, 243),
    this.isHome = false,
    }
  ): super(key: key);


  @override
  Size get preferredSize => Size.fromHeight(Screen.percentHeight(isHome?10:15));

  @override
  AppBar build(BuildContext context) {
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
      bottom:isHome
        ?const PreferredSize(
          preferredSize: Size.zero,
          child: SizedBox()
        )
        :PreferredSize(
          preferredSize: Size.fromHeight(Screen.percentHeight(5)),
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: Screen.percentHeight(5),
            child: Center(
              child: Text(title),
            ),
          ),
        ),
      backgroundColor: backgroundColor  
    );
  }
}
