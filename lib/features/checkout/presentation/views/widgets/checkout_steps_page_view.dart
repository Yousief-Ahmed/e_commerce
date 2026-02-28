import 'package:e_commerce/features/checkout/presentation/manager/provider/reference_provider.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final providerPageController = context.read<CheckoutRefs>().pageController;
    return PageView.builder(
      controller: providerPageController,
      itemCount: getCheckoutPages().length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return getCheckoutPages()[index];
      },
    );
  }

  List<Widget> getCheckoutPages() {
    return [
      const ShippingSection(),
      AddressInputSection(),
      const PaymentSection(),
    ];
  }
}
