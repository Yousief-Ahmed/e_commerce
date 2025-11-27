import 'package:e_commerce/features/home/presentaion/views/widgets/featured_list.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/products_featured_header.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/products_featured_item.dart';
import 'package:flutter/material.dart';

class ProductsFeaturedSection extends StatelessWidget {
  const ProductsFeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductsFeaturedHeader(),
        SizedBox(height: 8),
        FeaturedList(featuredItem: () => ProductsFeaturedItem(), itemCount: 7),
        SizedBox(height: 24),
      ],
    );
  }
}