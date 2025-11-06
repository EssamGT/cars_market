// import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserDetailsDataSource {
  Future<Either<Failure, void>> sendEmailVerification();
  Future<Either<Failure, Stream<User?>>> authStateChanges();
  // Future<AuthResponse> refreshSession();
  Future<Either<Failure, void>> addPhoneNumber(String phoneNumber);
  Future<Either<Failure, UserCredential>> verifyOTP(String otp);
  Future<Either<Failure, User?>> getCurrentUser();
  Future<Either<Failure, void>> updateName(String name);
}
