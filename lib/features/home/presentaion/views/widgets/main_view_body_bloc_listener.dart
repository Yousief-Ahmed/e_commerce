import 'package:e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce/core/helper_functions/build_success_bar.dart';
import 'package:e_commerce/features/home/presentaion/cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          buildSuccessBar(message: "تمت إضافة المنتج بنجاح ");
        }

        if (state is CartItemRemoved) {
          buildErrorBar(message: "تم حذف المنتج بنجاح");
        }
      },
      child: MainViewBody(currentIndex: currentIndex),
    );
  }
}
