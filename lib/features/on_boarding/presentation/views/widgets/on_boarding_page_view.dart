import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  final PageController pageController;
  const OnBoardingPageView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true,
          backgroundImage:
              Assets.imagesPageViewItemPageViewItem1BackgroundImage,
          image: Assets.imagesPageViewItemPageViewItem1Image,
          subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "مرحباً بك في ",
              style: TextStyles.bold23.copyWith(
                color: Color(0xFF0C0D0D),
                fontFamily: 'Cairo',
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "Fruit",
                  style: TextStyles.bold23.copyWith(
                    color: AppColors.primaryColor,
                    fontFamily: 'Cairo',
                  ),
                ),
                TextSpan(
                  text: "HUB",
                  style: TextStyles.bold23.copyWith(
                    color: AppColors.secondaryColor,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ),
        ),
        PageViewItem(
          isVisible: false,
          backgroundImage:
              Assets.imagesPageViewItemPageViewItem2BackgroundImage,
          image: Assets.imagesPageViewItemPageViewItem2Image,
          subTitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          title: Text("ابحث وتسوق", style: TextStyles.bold23),
        ),
      ],
    );
  }
}
