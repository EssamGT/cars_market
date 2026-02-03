import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserDetailsRepo {
  Future<Either<Failure, void>> sendEmailVerification();
  Future<Either<Failure, Stream<User?>>> authStateChanges();
  // Future<AuthResponse> refreshSession();
  Future<Either<Failure, void>> sendOTP(String phoneNumber);
  Future<Either<Failure, void>> resendOTP(String phoneNumber);
  Future<Either<Failure, UserCredential>> verifyOTP(String otp);
  Future<Either<Failure, void>> updateName(String name);
  // Future<Either<Failure, User?>> getCurrentUser();
}
