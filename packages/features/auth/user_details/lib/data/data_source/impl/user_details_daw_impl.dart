import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/remote_manager.dart';
import 'package:user_details/data/data_source/user_details_data_source.dart';

@Injectable(as: UserDetailsDataSource, env: [Environment.dev])
class UserDetailsDawImplD extends UserDetailsDataSource {
  RemoteManager remote;
  UserDetailsDawImplD(this.remote);
  @override
  Future<Either<Failure, void>> sendEmailVerification() async {
    try {
      await remote.requestEmailVerification();
      return const Right(null);
    } on FirebaseAuthException catch (ex) {
      printToConsole(ex.code);
      printToConsole("${ex.message}");
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    } catch (e) {
      printToConsole(e.toString());
      return Left(Failure(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Stream<User?>>> authStateChanges() async {
    try {
      final user = remote.authStateChanges();
      return Right(user);
    } catch (e) {
      printToConsole(e.toString());
      return Left(Failure(code: e.toString(), message: e.toString()));
    }
  }

  // @override
  // Future<AuthResponse> refreshSession() {
  //   return remote.refreshSession();
  // }

  @override
  Future<Either<Failure, void>> addPhoneNumber(String phoneNumber) async {
    try {
      final func = await remote.addPhoneNumber(phoneNumber);
      return func;
    } on FirebaseAuthException catch (ex) {
      printToConsole(ex.code);
      printToConsole("${ex.message}");
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    } catch (e) {
      printToConsole(e.toString());
      return Left(Failure(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> verifyOTP(String otp) async {
    try {
      final credential = await remote.verifyOTP(otp);
      return Right(credential);
    } on FirebaseAuthException catch (ex) {
      printToConsole(ex.code);
      printToConsole("${ex.message}");
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    } catch (e) {
      printToConsole(e.toString());

      return Left(Failure(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final user = remote.getCurrentUser();
      return Right(user);
    } on FirebaseAuthException catch (ex) {
      printToConsole(ex.code);
      printToConsole("${ex.message}");
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    } catch (e) {
      printToConsole(e.toString());
      return Left(Failure(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateName(String name) async {
    try {
      remote.updateName(name);
      return const Right(null);
    } on FirebaseAuthException catch (ex) {
      printToConsole(ex.code);
      printToConsole("${ex.message}");
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    } catch (e) {
      printToConsole(e.toString());
      return Left(Failure(code: e.toString(), message: e.toString()));
    }
  }
}

@Injectable(as: UserDetailsDataSource, env: [Environment.prod])
class UserDetailsDawImplP extends UserDetailsDataSource {
  RemoteManager remote;
  UserDetailsDawImplP(this.remote);
  @override
  Future<Either<Failure, void>> sendEmailVerification() async {
    try {
      await remote.requestEmailVerification();
      return const Right(null);
    } on FirebaseAuthException catch (ex) {
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    }
  }

  @override
  Future<Either<Failure, Stream<User?>>> authStateChanges() async {
    try {
      final user = remote.authStateChanges();
      return Right(user);
    } on FirebaseAuthException catch (ex) {
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    }
  }

  // @override
  // Future<AuthResponse> refreshSession() {
  //   return remote.refreshSession();
  // }

  @override
  Future<Either<Failure, void>> addPhoneNumber(String phoneNumber) async {
    try {
      final func = await remote.addPhoneNumber(phoneNumber);
      return func;
    } on FirebaseAuthException catch (ex) {
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> verifyOTP(String otp) async {
    try {
      final credential = await remote.verifyOTP(otp);
      return Right(credential);
    } on FirebaseAuthException catch (ex) {
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final user = remote.getCurrentUser();
      return Right(user);
    } on FirebaseAuthException catch (ex) {
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    }
  }

  @override
  Future<Either<Failure, void>> updateName(String name) async {
    try {
      remote.updateName(name);
      return const Right(null);
    } on FirebaseAuthException catch (ex) {
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    }
  }
}
