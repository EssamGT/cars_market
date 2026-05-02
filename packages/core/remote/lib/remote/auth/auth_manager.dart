import 'dart:async';
import 'package:cars_market/globle/globle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:constants/constants_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:data/models/user/user_data.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthManager {
  // final Supabase supabase;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseStore;
  AuthManager({required this.firebaseAuth, required this.firebaseStore});
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
    final doc = await firebaseStore
        .collection(usersDataBase!)
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    if (doc.exists) {
      final userDataFromDoc = UserData.fromJson(doc.data()!);
      final UserData userData = UserData(
        favoriteCarsIds: userDataFromDoc.favoriteCarsIds,
        userListedCarsIds: userDataFromDoc.userListedCarsIds,
        id: firebaseAuth.currentUser!.uid,
        name: firebaseAuth.currentUser!.displayName ?? "",
        email: firebaseAuth.currentUser!.email ?? "",
        phoneNumber: firebaseAuth.currentUser!.phoneNumber ?? "",
        verifiedEmail: firebaseAuth.currentUser!.emailVerified,
        createdAt: userDataFromDoc.createdAt,
      );
      return userData;
    }
    return UserData.init();
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
    final uid = firebaseAuth.currentUser?.uid;
    if (uid != null) {
      await firebaseStore
          .collection(usersDataBase!)
          .doc(uid)
          .set(userData.toJson());
    }
  }

  Future<Either<Failure, void>> sendOTP(
    String phoneNumber, [
    int? forceResendingToken,
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
              // If user is signed in, link the phone credential to the existing account
              await current.linkWithCredential(credential);
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

  Future<Either<Failure, void>> resendOTP(String phoneNumber) {
    return sendOTP(phoneNumber, _lastResendToken);
  }

  Future<UserCredential> verifyOTP(String otp) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp,
    );
    return await firebaseAuth.currentUser!.linkWithCredential(credential);
  }

  Future<void> forgotPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateName(String name) async {
    await firebaseAuth.currentUser?.updateDisplayName(name);
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
    await firebaseStore
        .collection(usersDataBase!)
        .doc(firebaseAuth.currentUser!.uid)
        .update({UserDataKeys.name: newDisplayName});
    userData = await getUserData();
  }

  Future<void> userEmailUpdated(String newEmail) async {
    await firebaseAuth.currentUser!.verifyBeforeUpdateEmail(newEmail);
    // await firebaseStore
    //     .collection(usersDataBase!)
    //     .doc(firebaseAuth.currentUser!.uid)
    //     .update({UserDataKeys.email: newEmail});
    // userData = await getUserData();
  }

  Future<void> userPhoneUpdated(String otp) async {

    await firebaseAuth.currentUser!.updatePhoneNumber(
      PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      ),
    );
    // await firebaseStore
    //     .collection(usersDataBase!)
    //     .doc(firebaseAuth.currentUser!.uid)
    //     .update({UserDataKeys.phoneNumber: newPhone});
    // userData = await getUserData();
  }

  Future<void> userPasswordUpdated(String newPassword) async {
    await firebaseAuth.currentUser!.updatePassword(newPassword);
  }
}
