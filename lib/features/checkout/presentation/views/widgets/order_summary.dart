import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'مجموع الطلبات :',
                style: TextStyles.regular13.copyWith(color: Color(0xFF4E5556)),
              ),
              Spacer(),
              Text(
                '150 جنيه',
                style: TextStyles.semiBold16.copyWith(color: Color(0xFF0C0D0D)),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'التوصيل :',
                style: TextStyles.regular13.copyWith(color: Color(0xFF4E5556)),
              ),
              Spacer(),
              Text(
                '30 جنيه',
                style: TextStyles.semiBold13.copyWith(color: Color(0xFF4E5556)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Divider(
            thickness: 0.5,
            color: Color(0xFFCACECE),
            endIndent: 32,
            indent: 32,
          ),
          Row(
            children: [
              Text(
                'الكلي :',
                style: TextStyles.bold16.copyWith(color: Color(0xFF0C0D0D)),
              ),
              Spacer(),
              Text(
                '180 جنيه',
                style: TextStyles.bold16.copyWith(color: Color(0xFF0C0D0D)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
