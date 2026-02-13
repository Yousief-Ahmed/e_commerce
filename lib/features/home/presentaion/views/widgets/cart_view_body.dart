import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/custom_divider.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:e_commerce/features/home/presentaion/cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/presentaion/cubit/cart_item_cubit/cart_item_cubit.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/cart_header.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/cart_item_list.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/cart_payment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  final ScrollController _scrollController = ScrollController();
  bool _isFabVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isFabVisible) setState(() => _isFabVisible = false);
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isFabVisible) setState(() => _isFabVisible = true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            top: 16,
                            start: kHorizontalPadding,
                            end: kHorizontalPadding,
                          ),
                          child: buildAppBar(
                            context,
                            title: 'السلة',
                            showNotification: false,
                            showBackButton: false,
                          ),
                        ),
                        SizedBox(height: kHeightSpacing),
                        const CartHeader(),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child:
                        context.read<CartCubit>().cartEntity.cartItems.isEmpty
                        ? const SizedBox()
                        : const CustomDivider(),
                  ),
                  CartItemList(
                    cartItems: context.watch<CartCubit>().cartEntity.cartItems,
                  ),
                  SliverToBoxAdapter(
                    child:
                        context.read<CartCubit>().cartEntity.cartItems.isEmpty
                        ? const SizedBox()
                        : const CustomDivider(),
                  ),
                ],
              ),
              CartPaymentButton(isFabVisible: _isFabVisible),
            ],
          );
        },
      ),
    );
  }
}
