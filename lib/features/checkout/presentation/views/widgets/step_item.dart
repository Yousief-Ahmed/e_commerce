import 'package:e_commerce/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/in_active_step_item.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  final String title,stepNumber;
  final bool isActive;
  const StepItem({super.key, required this.title, required this.stepNumber, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InActiveStepItem(title: title, stepNumber: stepNumber),
      secondChild: ActiveStepItem(title: title),
      crossFadeState: isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Duration(milliseconds: 300),
    );
  }
}
