import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/best_selling_fruits/presentation/views/widgets/best_selling_view.dart';
import 'package:flutter/material.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, BestSellingView.routeName);
      },
      child: Row(
        children: [
          Text(
            "الأكثر مبيعاً",
            textAlign: TextAlign.right,
            style: TextStyles.bold16,
          ),
          Spacer(),
          Text(
            "المزيد",
            style: TextStyles.regular13.copyWith(color: Color(0xFF949D9E)),
          ),
        ],
      ),
    );
  }
}
