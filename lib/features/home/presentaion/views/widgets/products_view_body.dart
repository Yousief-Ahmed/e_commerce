import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/best_selling_section.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/products_featured_section.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/products_header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 16,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: ProductsHeaderSection()),
          SliverToBoxAdapter(child: ProductsFeaturedSection()),
          ...BestSellingSection.buildBestSellingSection(),
        ],
      ),
    );
  }
}
