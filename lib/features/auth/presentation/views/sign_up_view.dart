import 'package:e_commerce/core/services/getit_service.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signup_cubit/cubit/signup_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signup_cubit/cubit/signup_state.dart';
import 'package:e_commerce/features/auth/presentation/views/sign_up_view_body_bloc_consumer.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const String routeName = 'signUp';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: const SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}
