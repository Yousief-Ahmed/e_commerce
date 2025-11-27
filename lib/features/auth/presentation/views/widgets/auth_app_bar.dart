import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/notification_icon.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(context, {required String title , bool showBackButton = true}) {
  return AppBar(
    title: Text(title, style: TextStyles.bold19),
    centerTitle: true,
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back_ios_new),
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NotificationIconWidget(),
      ),
    ],
  );
}
