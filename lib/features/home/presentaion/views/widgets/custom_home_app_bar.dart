import 'package:e_commerce/core/helper_functions/get_user.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/notification_icon.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12),
      leading: Image.asset(Assets.imagesHomeProfileImage),
      title: Text(
        "صباح الخير !..",
        style: TextStyles.semiBold16.copyWith(color: Color(0xFF949D9E)),
      ),
      subtitle: Text(getUser().name, style: TextStyles.bold16),
      trailing: NotificationIconWidget(),
    );
  }
}
