import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:data/models/user/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UpdateUserDataRepo {
  Future<Either<Failure, void>> userNameUpdate(String newName);
  Future<Either<Failure, void>> userEmailUpdate(String newEmail);
  Future<Either<Failure, Stream<User?>>> authStateChanges();
  Future<Either<Failure, UserData>> getUserData();
  Future<Either<Failure, void>> userPhoneUpdate(String newPhone);
  Future<Either<Failure, void>> verifyOTP(String otp);
  Future<Either<Failure, void>> resendOTP(String phoneNumber);
  Future<Either<Failure, void>> userPasswordUpdate(String newPassword);
  Future<Either<Failure, void>> userDelete();
  Future<Either<Failure, void>> userPhoneUpdateDB(String newPhone);
}
