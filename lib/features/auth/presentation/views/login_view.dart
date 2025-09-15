import 'package:e_commerce/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل الدخول'),
      body: const LoginViewBody(),
    );
  }
}
