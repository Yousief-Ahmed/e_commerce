import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/services/shared_prefrences_singleton.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/auth/presentation/views/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.backgroundImage,
    required this.image,
    required this.subTitle,
    required this.title,
    required this.isVisible,
  });

  final String backgroundImage, image;
  final String subTitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              isVisible
                  ? Positioned.fill(
                      child: Opacity(
                        opacity: 0.7, // 👈 درجة الشفافية اللي بتفتح اللون
                        child: SvgPicture.asset(
                          Assets
                              .imagesPageViewItemPageViewItem1BackgroundImageWhite,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),

              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              InkWell(
                onTap: () {
                  SharedPref.setBool(kIsOnBoardingViewSeen, true);
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(SigninView.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Visibility(
                    visible: isVisible,
                    child: Text(
                      "تخط",
                      style: TextStyles.regular13.copyWith(
                        color: Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(color: Color(0xFF4E5556)),
          ),
        ),
      ],
    );
  }
}
