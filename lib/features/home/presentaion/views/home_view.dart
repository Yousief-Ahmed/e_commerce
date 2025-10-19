import 'package:e_commerce/features/home/presentaion/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: HomeViewBody()),
      bottomNavigationBar:  CustomBottomNavigationBar(),
    );
  }
}
