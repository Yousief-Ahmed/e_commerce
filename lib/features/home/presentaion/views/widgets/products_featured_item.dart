import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductsFeaturedItem extends StatelessWidget {
  const ProductsFeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFF3F5F7),
          ),
          child: Image.asset(Assets.imagesWatermelon, fit: BoxFit.contain),
        ),
        const SizedBox(height: 6),
        Text("بطيخ", style: TextStyles.bold13),
      ],
    );
  }
}
