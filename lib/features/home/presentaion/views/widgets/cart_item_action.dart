import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/home/domain/entities/cart_item_entity.dart';
import 'package:e_commerce/features/home/presentaion/cubit/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemActionButtons extends StatelessWidget {
  final CartItemEntity cartItemEntity;
  const CartItemActionButtons({super.key, required this.cartItemEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          color: AppColors.primaryColor,
          icon: Icons.add,
          iconColor: Colors.white,
          onPressed: () {
            cartItemEntity.increaseItemCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            cartItemEntity.count.toString(),
            style: TextStyles.bold16,
          ),
        ),
        CartItemActionButton(
          color: Color(0xFFF3F5F7),
          icon: Icons.remove,
          iconColor: Color(0xFF979899),
          onPressed: () {
            cartItemEntity.decreaseItemCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
        ),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    required this.color,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
  });
  final Color color;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      padding: EdgeInsets.all(2),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: InkWell(
        onTap: onPressed,
        child: FittedBox(child: Icon(icon, color: iconColor)),
      ),
    );
  }
}
