import 'package:e_commerce/features/home/presentaion/views/cart_view.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/home_view.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/products_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'main_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: const [HomeView(), ProductsView(), CartView()],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
