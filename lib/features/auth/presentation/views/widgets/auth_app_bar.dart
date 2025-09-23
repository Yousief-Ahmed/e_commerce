import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    title: Text(title, style: TextStyles.bold19),
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(Icons.arrow_back_ios_new_outlined),
    ),
    backgroundColor: Colors.white,
  );
}
