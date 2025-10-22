import 'package:e_commerce/features/home/presentaion/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/home_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const routeName = 'main_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeView()),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
