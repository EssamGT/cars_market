import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:data/models/user/user_data.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/auth/auth_manager.dart';
import 'package:update_user_data/data/data_source/edit_user_data_daw.dart';

@Injectable(as: UpdateUserDataDaw)
class UpdateUserDataDawImpl extends UpdateUserDataDaw {
  AuthManager authManager;
  UpdateUserDataDawImpl(this.authManager);
  @override
  Future<Either<Failure, void>> userNameUpdate(String newName) async {
    try {
      await authManager.userNameUpdated(newName);
      return const Right(null);
    } catch (e) {
      return Left(
        Failure(message: 'Failed to update user name', code: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, void>> userEmailUpdate(String newEmail) async {
    try {
      await authManager.userEmailUpdated(newEmail);
      return const Right(null);
    } catch (e) {
      return Left(
        Failure(message: 'Failed to update user email', code: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, Stream<User?>>> authStateChanges() async {
    try {
      final user = authManager.authStateChanges();
      return Right(user);
    } on FirebaseAuthException catch (ex) {
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    }
  }

  @override
  Future<Either<Failure, UserData>> getUserData() async {
    try {
      final userData = await authManager.getUserData();
      return Right(userData);
    } on FirebaseAuthException catch (ex) {
      return Left(AuthErrorHandler.handleFirebaseAuthError(ex));
    } catch (e) {
      return Left(Failure(code: 'unknown', message: e.toString()));
    }
  }
  // still under testing

  @override
  Future<Either<Failure, void>> userPhoneUpdate(String newPhone) async {
    try {
      await authManager.sendOTP(newPhone);
      return const Right(null);
    } catch (e) {
      print("########################################");
      print(e.toString());
      return Left(
        Failure(message: 'Failed to update user phone', code: e.toString()),
      );
    }
  }
  // still under testing

  @override
  Future<Either<Failure, void>> resendOTP(String phoneNumber) async {
    try {
      await authManager.resendOTP(phoneNumber);
      return const Right(null);
    } catch (e) {
      print("########################################");
      print(e.toString());
      return Left(Failure(message: 'Failed to resend OTP', code: e.toString()));
    }
  }

  // still under testing
  @override
  Future<Either<Failure, void>> verifyOTP(String otp) async {
    try {
      await authManager.userPhoneUpdated(otp);
      return const Right(null);
    } catch (e) {
      print("########################################");
      print(e.toString());
      return Left(Failure(message: 'Failed to verify OTP', code: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> userPasswordUpdate(String newPassword) async {
    try {
      await authManager.userPasswordUpdated(newPassword);
      return const Right(null);
    } catch (e) {
      print("########################################");
      print(e.toString());
      return Left(
        Failure(
          message: 'Failed to update user password/n ${e.toString()}',
          code: e.toString(),
        ),
      );
    }
  }
}
