import 'package:flutter/material.dart';

class InactiveShippingItemDot extends StatelessWidget {
  const InactiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(color: Color(0xFF949D9E), width: 1.0),
        ),
      ),
    );
  }
}
