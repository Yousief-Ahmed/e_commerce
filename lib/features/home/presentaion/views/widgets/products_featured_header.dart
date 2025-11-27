import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductsFeaturedHeader extends StatelessWidget {
  const ProductsFeaturedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Row(
        children: [
          Text(
            " منتجاتنا ",
            textAlign: TextAlign.right,
            style: TextStyles.bold16,
          ),
          Spacer(),
          SvgPicture.asset(Assets.imagesArrowSwap),
        ],
      ),
    );
  }
}
