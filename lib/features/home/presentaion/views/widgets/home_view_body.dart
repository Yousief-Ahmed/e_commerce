import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/custom_search_text_field.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/best_selling_grid_view.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/best_selling_header.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/custom_home_app_bar.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/featured_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  
  const HomeViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),
                SizedBox(height: kHeightSpacing),
                CustomSearchTextField(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 12),
                BestSellingHeader(),
                SizedBox(height: 8),
              ],
            ),
          ),
          BestSellingGridView(),
        ],
      ),
    );
  }
}
