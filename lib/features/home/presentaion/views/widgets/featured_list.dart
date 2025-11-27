import 'package:flutter/material.dart';

class FeaturedList extends StatelessWidget {
  final int itemCount;
  final Widget Function() featuredItem;
  const FeaturedList({
    super.key,
    required this.featuredItem,
    this.itemCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(itemCount, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: featuredItem(),
          );
        }),
      ),
    );
  }
}
