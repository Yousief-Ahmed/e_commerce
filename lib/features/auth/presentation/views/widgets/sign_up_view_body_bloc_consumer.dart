import 'package:e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:e_commerce/core/helper_functions/build_success_bar.dart';
import 'package:e_commerce/core/widgets/custom_progress_hud.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signup_cubit/cubit/signup_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signup_cubit/cubit/signup_state.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:e_commerce/features/home/presentaion/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          buildErrorBar(message: state.msg);
        }
        if (state is SignupSuccess) {
          buildSuccessBar(message: 'تم إنشاء الحساب بنجاح');
          Navigator.pushReplacementNamed(context, MainView.routeName);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignupLoading ? true : false,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
