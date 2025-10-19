import 'package:e_commerce/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/active_bottom_navigation_bar_item.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/inActive_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      switchOutCurve: Curves.easeOut,
      switchInCurve: Curves.easeOut,
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),

      child: Center(
        child: isSelected
            ? ActiveBottomNavigationBarItem(
                image: bottomNavigationBarEntity.activeImage,
                text: bottomNavigationBarEntity.name,
              )
            : InActiveBottomNavigationBarItem(
                image: bottomNavigationBarEntity.inActiveImage,
              ),
      ),
    );
  }
}
