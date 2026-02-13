import 'package:e_commerce/features/home/presentaion/cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/main_view_body_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: SafeArea(
          child: MainViewBodyBlocListener(currentIndex: currentIndex),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
