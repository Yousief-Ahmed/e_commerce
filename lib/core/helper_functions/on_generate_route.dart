import 'package:e_commerce/core/helper_functions/custom_page_routes.dart';
import 'package:e_commerce/features/auth/presentation/views/signin_view.dart';
import 'package:e_commerce/features/auth/presentation/views/sign_up_view.dart';
import 'package:e_commerce/features/best_selling_fruits/presentation/views/widgets/best_selling_view.dart';
import 'package:e_commerce/features/home/presentaion/views/main_view.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> ongGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => OnBoardingView());
    case SigninView.routeName:
      return CustomPageRoutes.slideToRight(const SigninView());
    case SignUpView.routeName:
      return CustomPageRoutes.slideToRight(const SignUpView());
    case MainView.routeName:
      return CustomPageRoutes.slideToRight(MainView());
    case BestSellingView.routeName:
      return CustomPageRoutes.slideToRight(const BestSellingView());

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('No route defined for this path')),
        ),
      );
  }
}
