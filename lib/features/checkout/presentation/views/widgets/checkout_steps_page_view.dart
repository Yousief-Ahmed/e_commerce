import 'package:e_commerce/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CheckoutStepsPageView extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  final PageController pageController;
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey, required this.valueListenable,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
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
      AddressInputSection(formKey: formKey, valueListenable: valueListenable),
      const PaymentSection(),
    ];
  }
}
