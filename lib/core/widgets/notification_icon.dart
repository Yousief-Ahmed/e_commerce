import 'package:e_commerce/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationIconWidget extends StatelessWidget {
  const NotificationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: OvalBorder(),
        color: Color(0xFFEEF8ED),
      ),
      child: SvgPicture.asset(Assets.imagesNotification),
    );
  }
}
