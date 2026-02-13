import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class InActiveStepItem extends StatelessWidget {
  final String title, stepNumber;
  const InActiveStepItem({super.key, required this.title, required this.stepNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: Color(0xFFF2F3F3),
          child: Text(stepNumber, style: TextStyles.semiBold13),
        ),
        SizedBox(width: 4),
        Text(
          title,
          style: TextStyles.semiBold13.copyWith(color: Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}
