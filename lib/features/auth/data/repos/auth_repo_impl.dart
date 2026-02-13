import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:e_commerce/core/services/shared_prefrences_singleton.dart';
import 'package:e_commerce/core/utils/backend_endpoint.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.databaseService,
    required this.firebaseAuthService,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
      );
      var userEntity = UserEntity(name: name, email: email, uid: user.uid);
      await addUserData(user: userEntity);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure('حدث خطأ غير معروف. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email,
        password,
      );
      var userEntity = await getUserFromDatabase(uid: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure('حدث خطأ غير معروف. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      bool isUserExist = await databaseService.isUserExist(
        collectionPath: BackendEndpoint.isUserExist,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserFromDatabase(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await saveUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await firebaseAuthService.deleteUser();
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return left(
        ServerFailure('حدث خطأ غير معروف. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      bool isUserExist = await databaseService.isUserExist(
        collectionPath: BackendEndpoint.isUserExist,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserFromDatabase(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await saveUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await firebaseAuthService.deleteUser();
      log('Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return left(
        ServerFailure('حدث خطأ غير معروف. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      var userEntity = UserModel.fromFirebaseUser(user);
      bool isUserExist = await databaseService.isUserExist(
        collectionPath: BackendEndpoint.isUserExist,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserFromDatabase(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await saveUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await firebaseAuthService.deleteUser();
      log('Exception in AuthRepoImpl.signInWithApple: ${e.toString()}');
      return left(
        ServerFailure('حدث خطأ غير معروف. الرجاء المحاولة مرة أخرى.'),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      collectionPath: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uid,
    );
  }

  @override
  Future<UserEntity> getUserFromDatabase({required String uid}) async {
    var userData = await databaseService.getData(
      collectionPath: BackendEndpoint.getUserData,
      documentId: uid,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await SharedPref.setString(kUserData, jsonData);
  }
}
