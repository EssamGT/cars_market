import 'dart:async';
import 'dart:io';
import 'package:constants/constants_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/car_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

@singleton
class RemoteManager {
  final Supabase supabase;
  final FirebaseAuth firebaseAuth;
  RemoteManager(this.supabase, this.firebaseAuth);
  String _verificationId = '';
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
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  Future<void> requestEmailVerification() async {
    // print('Email verification requested');
    await firebaseAuth.currentUser?.sendEmailVerification();
  }

  Stream<User?> authStateChanges() {
    return firebaseAuth.idTokenChanges().asBroadcastStream();
  }

  Future<Either<Failure, void>> addPhoneNumber(String phoneNumber) async {
    final completer = Completer<void>();

    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),

        verificationCompleted: (PhoneAuthCredential credential) {
          print('Auto verification attempted but ignored.');
        },

        verificationFailed: (FirebaseAuthException e) {
          if (!completer.isCompleted) {
            completer.completeError(
              Failure(
                code: e.code,
                message: e.message ?? 'Verification failed',
              ),
            );
          }
        },

        codeSent: (String verificationId, int? resendToken) {
          if (!completer.isCompleted) completer.complete();
          _verificationId = verificationId;
          print('OTP sent to $phoneNumber');
        },

        codeAutoRetrievalTimeout: (String verificationId) {
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
  // Future<AuthResponse> refreshSession() async {
  //   return await supabase.client.auth.refreshSession();
  // }

  Future<List<CarImage>> uploadImages(List<XFile> images, String uuid) async {
    List<CarImage> carImages = [];
    // var id = UuidV4().generate();
    for (var image in images.asMap().entries) {
      int index = image.key;
      String path = image.value.path;
      final response = await supabase.client.storage
          .from(AppConstants.imagesBucketId)
          .upload('$uuid/$index', File(path));
      CarImage carImage = CarImage(
        path: response.replaceRange(
          0,
          AppConstants.imagesBucketId.length + 1,
          '',
        ),
        url: supabase.client.storage
            .from(AppConstants.imagesBucketId)
            .getPublicUrl(
              response.replaceRange(
                0,
                AppConstants.imagesBucketId.length + 1,
                '',
              ),
            ),
      );
      carImages.add(carImage);
      // print(carImage.path);
      // print(carImage.url);
    }
    // print(carImages);

    return carImages;
  }

  Future<void> uploadCar(CarModel car) async {
    await supabase.client.from(AppConstants.carTable).insert(car.toJson());
  }

  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }
}
