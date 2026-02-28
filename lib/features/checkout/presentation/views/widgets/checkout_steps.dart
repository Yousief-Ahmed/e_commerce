import 'package:e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/manager/provider/reference_provider.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutSteps extends StatelessWidget {
  final int currentPageIndex;
  const CheckoutSteps({super.key, required this.currentPageIndex});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: InkWell(
            onTap: () {
              return _onTap(context, index);
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

  void _onTap(BuildContext context, int targetIndex) {
    final providerRef = context.read<CheckoutRefs>();
    if (targetIndex == currentPageIndex) {
      return;
    }
    if (targetIndex < currentPageIndex) {
      providerRef.pageController.animateToPage(
        targetIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
      return;
    }
    if (currentPageIndex == 0) {
      return _handleShippingSection(context, providerRef, targetIndex);
    }
    if (currentPageIndex == 1) {
      return _hanldeAddressInputSection(context, providerRef, targetIndex);
    }
  }

  void _handleShippingSection(
    BuildContext context,
    CheckoutRefs providerRef,
    int targetIndex,
  ) {
    if (context.read<OrderEntity>().payWithCash == null) {
      buildErrorBar(message: 'يرجى تحديد طريقة الدفع ');
      return;
    } else {
      if (targetIndex == 1) {
        providerRef.pageController.animateToPage(
          targetIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceIn,
        );
        return;
      }
      if (targetIndex == 2) {
        final valid = providerRef.formKey.currentState?.validate() == true;
        if (valid) {
          providerRef.formKey.currentState?.save();
          providerRef.pageController.animateToPage(
            targetIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceIn,
          );
          return;
        } else {
          buildErrorBar(message: 'برجاء ملئ بيانات العنوان أولاً ');
          return;
        }
      }
    }
  }

  void _hanldeAddressInputSection(
    BuildContext context,
    CheckoutRefs providerRef,
    int targetIndex,
  ) {
    final valid = providerRef.formKey.currentState?.validate() == true;
    if (valid) {
      providerRef.formKey.currentState?.save();
      providerRef.pageController.animateToPage(
        targetIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      providerRef.autovalidateNotifier.value = AutovalidateMode.always;
    }
  }

  List<String> getSteps() {
    return ['الشحن', 'العنوان', 'الدفع'];
  }
}
