//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenericAppBarMobile extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Color titleColor;
  final bool isLeading;
  Function()? backButton;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color backButtonColor;

  GenericAppBarMobile(
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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            // style: AppTheme.textAppBarMediumBold.copyWith(color: titleColor),
          ),
          if (subtitle != null)
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                subtitle!,
                // style: AppTheme.textNormal,
              ),
            ),
        ],
      ),
      leading: Visibility(
        visible: isLeading,
        child: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
            color: backButtonColor,
          ),
          // tooltip: tr('back__button'),
          onPressed: backButton,
        ),
      ),
      leadingWidth: !isLeading ? 0 : null,
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }
}
