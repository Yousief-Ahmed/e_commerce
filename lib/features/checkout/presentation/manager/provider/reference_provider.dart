import 'package:flutter/material.dart';

class CheckoutRefs {
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> autovalidateNotifier;

  CheckoutRefs({
    required this.pageController,
    required this.formKey,
    required this.autovalidateNotifier,
  });
}
