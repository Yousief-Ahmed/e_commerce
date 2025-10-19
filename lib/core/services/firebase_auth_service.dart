import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;
import 'package:crypto/crypto.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

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
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
          message: 'البريد الالكتروني او كلمة المرور غير صحيحة.',
        );
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

  /* Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance
        .authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
 */

  //old code
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  /* Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  } */

  ///////////////////////////////////////////////////////////

  Future<User> signInWithFacebook() async {
    final rawNonce = generateNonce();
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status != LoginStatus.success) {
        throw CustomException(message: 'فشل تسجيل الدخول عبر فيسبوك.');
      }
      final accessToken = loginResult.accessToken;
      final String? token =
          accessToken?.tokenString ?? accessToken?.tokenString;
      if (token == null) {
        throw CustomException(
          message: 'لم يتم استرجاع Access Token من فيسبوك.',
        );
      }
      OAuthCredential facebookCred = FacebookAuthProvider.credential(token);
      final userCred = await FirebaseAuth.instance.signInWithCredential(
        facebookCred,
      );
      if (Platform.isIOS) {
        switch (loginResult.accessToken!.type) {
          case AccessTokenType.classic:
            final token = loginResult.accessToken as ClassicToken;
            facebookCred = FacebookAuthProvider.credential(
              token.authenticationToken!,
            );
            break;
          case AccessTokenType.limited:
            final token = loginResult.accessToken as LimitedToken;
            facebookCred = OAuthCredential(
              providerId: 'facebook.com',
              signInMethod: 'oauth',
              idToken: token.tokenString,
              rawNonce: rawNonce,
            );
            break;
        }
      } else {
        facebookCred = FacebookAuthProvider.credential(
          loginResult.accessToken!.tokenString,
        );
      }
      return userCred.user!;
    } on FirebaseAuthException catch (e) {
      // بدون استخدام fetchSignInMethodsForEmail
      if (e.code == 'account-exists-with-different-credential') {
        final String? email = e.email;
        final AuthCredential? pendingCred = e.credential;

        if (email == null || pendingCred == null) {
          throw CustomException(message: 'بيانات الحساب غير مكتملة للربط.');
        }
        // حاول نربط بجوجل تلقائيًا
        try {
          final user = await _signInWithGoogleAndLink(pendingCred);
          return user;
        } catch (_) {
          // لو الربط بجوجل فشل، اطلب من المستخدم يسجّل بالمزوّد الأصلي (Email/Password أو Apple... إلخ) ثم اربط
          throw CustomException(
            message:
                'هذا البريد مسجل بمزوّد مختلف. سجّل دخولك بالمزوّد الأصلي (مثلاً Google أو البريد/كلمة السر) ثم أعد محاولة الربط عبر فيسبوك.',
          );
        }
      }
      throw CustomException(
        message: e.message ?? 'فشل تسجيل الدخول عبر فيسبوك.',
      );
    } catch (e) {
      log('Exception in signInWithFacebook: $e');
      throw CustomException(message: 'حدث خطأ غير متوقع.');
    }
  }

  Future<User> _signInWithGoogleAndLink(AuthCredential pendingCred) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    if (googleAuth == null) {
      throw CustomException(message: 'فشل تسجيل الدخول بجوجل.');
    }
    final OAuthCredential googleCred = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential googleUserCred = await FirebaseAuth.instance
        .signInWithCredential(googleCred);

    await googleUserCred.user!.linkWithCredential(pendingCred);
    return googleUserCred.user!;
  }

  Future<User> linkFacebookToCurrentUser(AuthCredential facebookCred) async {
    final User? current = FirebaseAuth.instance.currentUser;
    if (current == null) {
      throw CustomException(message: 'لا يوجد مستخدم مسجّل حالياً للربط.');
    }
    final UserCredential linked = await current.linkWithCredential(
      facebookCred,
    );
    return linked.user!;
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider(
      "apple.com",
    ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return (await FirebaseAuth.instance.signInWithCredential(
      oauthCredential,
    )).user!;
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
