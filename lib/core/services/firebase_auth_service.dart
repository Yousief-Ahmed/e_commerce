import 'dart:developer';

import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code: ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'البريد الإلكتروني مستخدم من قبل حساب آخر.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message:
              'فشل في الاتصال بالشبكة. الرجاء التحقق من اتصالك وحاول مرة أخرى.',
        );
      } else {
        throw CustomException(
          message: 'حدث خطأ غير معروف. الرجاء المحاولة مرة أخرى.',
        );
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(
        message: 'حدث خطأ غير معروف. الرجاء المحاولة مرة أخرى.',
      );
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code: ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'المستخدم غير موجود.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'البريد الالكتروني او كلمة المرور غير صحيحة.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message:
              'فشل في الاتصال بالشبكة. الرجاء التحقق من اتصالك وحاول مرة أخرى.',
        );
      } else {
        throw CustomException(
          message: 'حدث خطأ غير معروف. الرجاء المحاولة مرة أخرى.',
        );
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(
        message: 'حدث خطأ غير معروف. الرجاء المحاولة مرة أخرى.',
      );
    }
  }
}
