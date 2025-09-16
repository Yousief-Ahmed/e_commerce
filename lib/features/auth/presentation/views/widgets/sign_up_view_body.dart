import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/custom_text_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/already_have_account.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'حساب جديد'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            children: [
              SizedBox(height: 24),
              const CustomTextFormField(
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16),
              const CustomTextFormField(
                hintText: 'البريد الإلكتروني',
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
              const TermsAndConditions(),
              SizedBox(height: 33),
              CustomTextButton(text: 'إنشاء حساب جديد '),
              SizedBox(height: 26),
              const AlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
