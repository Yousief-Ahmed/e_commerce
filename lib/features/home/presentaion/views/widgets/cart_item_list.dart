import 'package:e_commerce/core/widgets/custom_divider.dart';
import 'package:e_commerce/features/home/domain/entities/cart_item_entity.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  final List<CartItemEntity> cartItems;
  const CartItemList({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CartItem(cartItemEntity: cartItems[index]),
        );
      },
      separatorBuilder: (context, index) {
        return CustomDivider();
      },
    );
  }
}
