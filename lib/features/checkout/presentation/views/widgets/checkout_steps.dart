import 'package:e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutSteps extends StatelessWidget {
  final int currentPageIndex;
  final PageController pageController;
  final ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  CheckoutSteps({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
  });
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: InkWell(
            onTap: () {
              if (currentPageIndex == 0) {
                _handleShippingSection(context);
              } else if (currentPageIndex == 1) {
                _hanldeAddressInputSection(context);
              }
            },
            child: StepItem(
              title: getSteps()[index],
              stepNumber: (index + 1).toString(),
              isActive: index <= currentPageIndex,
            ),
          ),
        );
      }),
    );
  }

  void _handleShippingSection(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      buildErrorBar(message: 'يرجى تحديد طريقة الدفع ');
    }
  }

  void _hanldeAddressInputSection(context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  List<String> getSteps() {
    return ['الشحن', 'العنوان', 'الدفع'];
  }
}
