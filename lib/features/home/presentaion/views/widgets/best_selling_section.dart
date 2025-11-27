import 'package:e_commerce/features/home/presentaion/views/widgets/best_selling_grid_view_bloc_builder.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/best_selling_header.dart';
import 'package:flutter/material.dart';

class BestSellingSection {
  static List<Widget> buildBestSellingSection() {
    return [
      SliverToBoxAdapter(
        child: Column(children: [BestSellingHeader(), SizedBox(height: 8)]),
      ),
      BestSellingGridViewBlocBuilder(),
    ];
  }
}
