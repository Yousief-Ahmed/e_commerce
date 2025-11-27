import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/custom_search_text_field.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:flutter/material.dart';

class ProductsHeaderSection extends StatelessWidget {
  const ProductsHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAppBar(context, title: "المنتجات", showBackButton: false),
        SizedBox(height: kHeightSpacing),
        CustomSearchTextField(),
        SizedBox(height: 16),
      ],
    );
  }
}
