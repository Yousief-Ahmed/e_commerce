import 'package:e_commerce/features/checkout/presentation/views/widgets/order_address_summary.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/order_summary.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrderSummary(),
        const SizedBox(height: 16),
        const OrderAddressSummary(),
      ],
    );
  }
}
