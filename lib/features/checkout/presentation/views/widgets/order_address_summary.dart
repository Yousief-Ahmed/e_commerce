import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderAddressSummary extends StatelessWidget {
  const OrderAddressSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: "عنوان التوصيل ",
      child: Row(
        children: [
          SvgPicture.asset(Assets.imagesOutlinedLocation),
          const SizedBox(width: 8),
          Text(
            'شارع النيل، مبنى رقم ١٢٣',
            style: TextStyles.regular16.copyWith(
              color: Color(0xFF4E5556),
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
          const Spacer(),
          InkWell(
            child: Row(
              children: [
                SvgPicture.asset(Assets.imagesOutlinedEdit),
                const SizedBox(width: 3),
                Text(
                  'تعديل',
                  style: TextStyles.semiBold13.copyWith(letterSpacing: 0),
                ),
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
