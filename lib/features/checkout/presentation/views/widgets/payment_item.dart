import 'package:e_commerce/core/utils/app_decorations.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  final String title;
  final Widget child;
  const PaymentItem({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title :',
          style: TextStyles.bold13.copyWith(color: Color(0xFF0C0D0D)),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: AppDecorations.greyBoxDecoration,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          child: child,
        ),
      ],
    );
  }
}
