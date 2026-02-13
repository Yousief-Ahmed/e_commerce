import 'package:e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce/core/widgets/custom_text_button.dart';
import 'package:e_commerce/features/checkout/presentation/views/checkout_view.dart';
import 'package:e_commerce/features/home/presentaion/cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/presentaion/cubit/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPaymentButton extends StatelessWidget {
  const CartPaymentButton({super.key, required bool isFabVisible})
    : _isFabVisible = isFabVisible;

  final bool _isFabVisible;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.08,
          left: 16,
          right: 16,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isFabVisible ? 1 : 0,
            child: CustomTextButton(
              text:
                  'الدفع ${context.read<CartCubit>().cartEntity.calculateTotalCartPrice()} جنيه',
              onPressed: () {
                // Navigate to checkout view
                if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
                  Navigator.pushNamed(context, CheckoutView.routeName,
                  arguments: context.read<CartCubit>().cartEntity);
                } else {
                  buildErrorBar(message: 'لا يوجد منتجات فى السلة');
                }
              },
            ),
          ),
        );
      },
    );
  }
}
