import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFDDDFDF))),
        SizedBox(width: 18),
        Text("أو", style: TextStyles.semiBold16),
        SizedBox(width: 18),
        Expanded(child: Divider(color: Color(0xFFDDDFDF))),
       
      ],
    );
  }
}
