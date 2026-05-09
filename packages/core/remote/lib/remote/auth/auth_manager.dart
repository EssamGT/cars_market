import 'dart:async';
import 'package:cars_market/globle/globle.dart';
import 'package:constants/constants_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:data/models/user/user_data.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/firebase/firebase_db_manager.dart';

@singleton
class AuthManager {
  // final Supabase supabase;
  final FirebaseAuth firebaseAuth;
  final FirebaseDbManager dbManager;

  AuthManager({required this.firebaseAuth, required this.dbManager});
  String _verificationId = '';
  int? _lastResendToken;
  final usersDataBase = dotenv.env[AppConstants.usersDataBaseKey];

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((s) async {
          if (s.user != null) {
            userData = await getUserData();
          }
          return s;
        });
  }

  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // .then((s) async {
    //   await firebaseStore
    //       .collection(usersDataBase!)
    //       .doc(s.user!.uid)
    //       .set(UserData.init().toJson());
    //   return s;
    // });
  }

  Future<UserData> getUserData() async {
    return await dbManager.getUserData();
  }

  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  Future<void> requestEmailVerification() async {
    // print('Email verification requested');
    await firebaseAuth.currentUser?.sendEmailVerification();
  }

  Stream<User?> authStateChanges() {
    return firebaseAuth.userChanges().asBroadcastStream();
  }

  Future<void> setUserData(UserData userData) async {
    return await dbManager.setUserData(userData);
  }

  Future<Either<Failure, void>> sendOTP(
    String phoneNumber, [
    int? forceResendingToken,
    bool isUpdate = false,
  ]) async {
    final completer = Completer<void>();

    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 120),
        forceResendingToken: forceResendingToken,
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            final current = firebaseAuth.currentUser;
            if (current != null) {
              if (isUpdate) {
                await current.updatePhoneNumber(credential);
              } else {
                await current.linkWithCredential(credential);
              }
            }
            if (!completer.isCompleted) completer.complete();
            print('Auto verification successful.');
          } on FirebaseAuthException catch (e) {
            if (!completer.isCompleted) completer.completeError(e);
          } catch (e) {
            if (!completer.isCompleted) completer.completeError(e);
          }
        },

        verificationFailed: (FirebaseAuthException e) {
          if (!completer.isCompleted) {
            completer.completeError(e);
          }
        },

        codeSent: (String verificationId, int? resendToken) {
          if (!completer.isCompleted) completer.complete();
          _verificationId = verificationId;
          _lastResendToken = resendToken;
          print('OTP sent to $phoneNumber');
        },

        codeAutoRetrievalTimeout: (String verificationId) {
          print('aaa');
          _verificationId = verificationId;
        },
      );

      await completer.future;
      return const Right(null);
    } on FirebaseAuthException catch (ex) {
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    } catch (e) {
      return Left(Failure(code: 'unknown', message: e.toString()));
    }
  }

  Future<Either<Failure, void>> resendOTP(
    String phoneNumber, [
    bool isUpdate = false,
  ]) async {
    return sendOTP(phoneNumber, _lastResendToken, isUpdate);
  }

  Future<UserCredential> verifyOTP(String otp) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp,
    );
    return await firebaseAuth.currentUser!.linkWithCredential(credential);
  }

  Future<void> deleteAccount() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      await dbManager.deleteUserData();
      await user.delete();
    }
  }

  Future<void> forgotPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateName(String name) async {
    await firebaseAuth.currentUser?.updateDisplayName(name);
    // await dbManager.updateUserNameDB(name);
  }

  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  String getPhoneNumber() {
    return firebaseAuth.currentUser?.phoneNumber ?? '';
  }

  String getUserName() {
    return firebaseAuth.currentUser?.displayName ?? '';
  }

  Future<void> userNameUpdated(String newDisplayName) async {
    await firebaseAuth.currentUser!.updateDisplayName(newDisplayName);
    await dbManager.updateUserNameDB(newDisplayName);

    userData = await getUserData();
  }

  Future<void> userEmailUpdated(String newEmail) async {
    await firebaseAuth.currentUser!.verifyBeforeUpdateEmail(newEmail);
    
  }

  Future<void> userPhoneUpdated(String otp) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp,
    );

    await firebaseAuth.currentUser!.updatePhoneNumber(credential);
    // await firebaseStore
    //     .collection(usersDataBase!)
    //     .doc(firebaseAuth.currentUser!.uid)
    //     .update({UserDataKeys.phoneNumber: newPhone});
    // userData = await getUserData();
  }

  Future<void> updatePhoneNumberDB(String newPhone) async {
    await dbManager.updateUserPhoneDB(newPhone);
  }

  Future<void> userPasswordUpdated(String newPassword) async {
    await firebaseAuth.currentUser!.updatePassword(newPassword);
  }
}
