import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/featured_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32;
    return SizedBox(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: itemWidth * 0.4,
              child: Image.asset(
                Assets.imagesFeaturedImageTest,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: itemWidth * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: svg.Svg(Assets.imagesFeaturedItem),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 33),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 27),
                    Text(
                      "عروض العيد",
                      style: TextStyles.regular13.copyWith(color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      "خصم 25%",
                      style: TextStyles.bold19.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 11),
                    FeaturedItemButton(text: 'تسوق الان'),
                    SizedBox(height: 29),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
