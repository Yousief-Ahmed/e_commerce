import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OurProductsHeader extends StatelessWidget {
  final int productsLength;
  const OurProductsHeader({super.key, required this.productsLength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Row(
        children: [
          Text(
            " $productsLength نتائج ",
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
