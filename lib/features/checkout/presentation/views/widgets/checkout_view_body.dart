import 'dart:developer';

import 'package:e_commerce/core/helper_functions/build_app_bar.dart';
import 'package:e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce/core/helper_functions/build_success_bar.dart';
import 'package:e_commerce/core/utils/app_keys.dart';
import 'package:e_commerce/core/widgets/custom_text_button.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:e_commerce/features/checkout/presentation/manager/cubit/add_order/add_order_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/manager/provider/reference_provider.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late final PageController pageController;
  final ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  int currentPageIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page?.round() ?? 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<CheckoutRefs>.value(
      value: CheckoutRefs(
        pageController: pageController,
        formKey: formKey,
        autovalidateNotifier: valueNotifier,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            buildAppBar(context, title: 'الشحن', showNotification: false),
            const SizedBox(height: 20),
            CheckoutSteps(currentPageIndex: currentPageIndex),
            const SizedBox(height: 24),
            Expanded(child: CheckoutStepsPageView()),
            CustomTextButton(
              text: getCheckoutButtonText(currentPageIndex),
              onPressed: () {
                if (currentPageIndex == 0) {
                  _handleShippingSection(context);
                } else if (currentPageIndex == 1) {
                  _hanldeAddressInputSection(context);
                } else {
                  _processPayment(context);
                  /* var order = context.read<OrderEntity>();
                  context.read<AddOrderCubit>().addOrder(order: order); */
                }
              },
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
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
    final valid = formKey.currentState?.validate() == true;
    if (valid) {
      formKey.currentState?.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
      buildErrorBar(message: "برجاء ملئ جميع الحقول المطلوبة ");
    }
  }

  void _processPayment(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    var addOrderCubit = context.read<AddOrderCubit>();
    PaypalPaymentEntity paypalEntity = PaypalPaymentEntity.fromEntity(
      orderEntity,
    );
    log(paypalEntity.toJson().toString());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: paypalClientId,
          secretKey: paypalSecretKey,
          transactions: [paypalEntity.toJson()],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            // print("onSuccess: $params");
            log("Payment successful: $params");
            Navigator.pop(context);
            buildSuccessBar(message: 'تمت عملية الدفع بنجاح');
            addOrderCubit.addOrder(order: orderEntity);
          },
          onError: (error) {
            //print("onError: $error");
            log("Payment error: $error");
            Navigator.pop(context);
            buildErrorBar(
              message: "حدث خطأ أثناء عملية الدفع، يرجى المحاولة مرة أخرى",
            );
          },
          onCancel: () {
            //  print('cancelled:');
            log("Payment cancelled");
          },
        ),
      ),
    );
  }

  String getCheckoutButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'الدفع';
      case 2:
        return 'الدفع عبر PayPal';
      default:
        return 'التالي';
    }
  }
}
