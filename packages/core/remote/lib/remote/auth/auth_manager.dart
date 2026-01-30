import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthManager {
  // final Supabase supabase;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseStore;
  AuthManager(this.firebaseAuth, this.firebaseStore);
  String _verificationId = '';
  int? _lastResendToken;
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((s) async {
          await firebaseStore.collection('users').doc(s.user!.uid).set({
            'cars': [],
          });
          return s;
        });
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
}
