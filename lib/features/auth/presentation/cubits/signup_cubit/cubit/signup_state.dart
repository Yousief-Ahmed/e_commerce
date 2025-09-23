import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';

class SignupState {}

final class SignupInitial extends SignupState {}
final class SignupLoading extends SignupState {}
final class SignupSuccess extends SignupState {
  final UserEntity userEntity;
  SignupSuccess(this.userEntity);
}
final class SignupFailure extends SignupState {
  final String msg;
  SignupFailure(this.msg);
}
