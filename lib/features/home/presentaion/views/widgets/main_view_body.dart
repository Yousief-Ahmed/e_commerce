import 'package:e_commerce/features/home/presentaion/views/widgets/cart_view.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/home_view.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/products_view.dart';
import 'package:flutter/material.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentIndex,
      children: const [HomeView(), ProductsView(), CartView()],
    );
  }
}
