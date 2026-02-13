import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: AppColors.primaryColor,
        shape: OvalBorder(
          
          side: BorderSide(color: Colors.white, width: 4.0),
        ),
      ),
    );
  }
}
