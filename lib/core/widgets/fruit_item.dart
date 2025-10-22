import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  final ProductEntity product;
  const FruitItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.asset(product.imageUrl ?? Assets.imagesWatermelon),
                Spacer(),
                ListTile(
                  title: Text(
                    product.name,
                    textAlign: TextAlign.start,
                    style: TextStyles.semiBold16,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${product.price.toString()} جنية",
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' / ',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'الكيلو',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /* title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('بطيخ', style: TextStyles.semiBold16),
                      SizedBox(height: 4),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '20جنية',
                              style: TextStyles.bold13.copyWith(
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            TextSpan(
                              text: ' / ',
                              style: TextStyles.bold13.copyWith(
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            TextSpan(
                              text: 'الكيلو',
                              style: TextStyles.bold13.copyWith(
                                color: AppColors.lightSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ), */
                  trailing: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                  contentPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: 8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
