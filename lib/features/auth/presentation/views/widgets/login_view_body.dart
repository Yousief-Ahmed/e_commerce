import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/custom_text_button.dart';

import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 24),
            const CustomTextFormField(
              hintText: "البريد الإلكتروني",
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            const CustomTextFormField(
              hintText: "كلمة المرور",
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.remove_red_eye_rounded,
                color: Color(0xFFC9CECF),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور ؟',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 33),
            const CustomTextButton(text: 'تسجيل الدخول'),
            SizedBox(height: 33),
            const DontHaveAccount(),
            SizedBox(height: 33),
            const OrDivider(),
            SizedBox(height: 16),
            SocialLoginButton(
              iconName: Assets.imagesGoogleIcon,
              label: 'تسجيل بواسطة جوجل ',
            ),
            SizedBox(height: 16),
            SocialLoginButton(
              iconName: Assets.imagesAppleIcon,
              label: 'تسجيل بواسطة ابل ',
            ),
            SizedBox(height: 16),
            SocialLoginButton(
              iconName: Assets.imagesFacebookIcon,
              label: 'تسجيل بواسطة فيسبوك ',
            ),
          ],
        ),
      ),
    );
  }
}
