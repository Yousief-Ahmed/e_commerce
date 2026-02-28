import 'package:e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce/core/helper_functions/build_success_bar.dart';
import 'package:e_commerce/core/widgets/custom_progress_hud.dart';
import 'package:e_commerce/features/checkout/presentation/manager/cubit/add_order/add_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  final Widget child;
  const AddOrderCubitBlocBuilder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderError) {
          buildErrorBar(message: state.errorMessage);
        }
        if (state is AddOrderSuccess) {
          buildSuccessBar(message: 'تمت العملية بنجاح ');
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddOrderLoading,
          child: child,
        );
      },
    );
  }
}
