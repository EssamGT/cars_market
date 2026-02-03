import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:user_details/domain/repository/user_details_repo.dart';

@injectable
class UserDeatilsUseCase {
  UserDetailsRepo repo;
  UserDeatilsUseCase(this.repo);
  Future<Either<Failure, void>> sendEmailVerification() async {
    return await repo.sendEmailVerification();
  }

  Future<Either<Failure, Stream<User?>>> getAuthStateChanges() =>
      repo.authStateChanges();
  // Future<AuthResponse> refreshSession() => repo.refreshSession();

  Future<Either<Failure, void>> sendOTP(String phoneNumber) async {
    return await repo.sendOTP(phoneNumber);
  }
  Future<Either<Failure, void>> resendOTP(String phoneNumber) async {
    return await repo.resendOTP(phoneNumber);
  }

  Future<Either<Failure, UserCredential>> verifyOTP(String otp) async {
    return await repo.verifyOTP(otp);
  }

  Future<Either<Failure, void>> updateName(String name) async {
    return await repo.updateName(name);
  }
}
