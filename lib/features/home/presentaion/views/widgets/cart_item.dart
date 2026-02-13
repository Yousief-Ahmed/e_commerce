import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/custom_network_image.dart';
import 'package:e_commerce/features/home/domain/entities/cart_item_entity.dart';
import 'package:e_commerce/features/home/presentaion/cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/presentaion/cubit/cart_item_cubit/cart_item_cubit.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/cart_item_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartItem extends StatelessWidget {
  final CartItemEntity cartItemEntity;
  const CartItem({super.key, required this.cartItemEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                color: Color(0xFFF3F5F7),
                child: Align(
                  alignment: Alignment.center,
                  child: CustomNetworkImage(
                    imageUrl: cartItemEntity.productEntity.imageUrl!,
                    width: 53,
                    height: 40,
                  ),
                ),
              ),
              SizedBox(width: 17),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: TextStyles.bold13,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().removeProduct(
                              cartItemEntity.productEntity,
                            );
                          },
                          child: SvgPicture.asset(Assets.imagesTrash),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "${cartItemEntity.calculateTotalWeight().toString()} كم",
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        CartItemActionButtons(cartItemEntity: cartItemEntity),
                        Spacer(),
                        Text(
                          '${cartItemEntity.calculateTotalPrice().toString()} جنيه ',
                          style: TextStyles.bold16.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
