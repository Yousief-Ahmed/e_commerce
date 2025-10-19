import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveBottomNavigationBarItem extends StatelessWidget {
  final String image;
  const InActiveBottomNavigationBarItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image);
  }
}
