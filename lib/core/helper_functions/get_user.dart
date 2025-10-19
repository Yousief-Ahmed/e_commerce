import 'dart:convert';

import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/services/shared_prefrences_singleton.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  var jsonString = SharedPref.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
