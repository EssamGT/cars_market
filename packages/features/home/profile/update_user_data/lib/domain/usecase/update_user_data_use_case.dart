import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:data/models/user/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:update_user_data/domain/repository/update_user_data_repo.dart';

@injectable
class UpdateUserDataUseCase {
  UpdateUserDataRepo repository;
  UpdateUserDataUseCase(this.repository);
  Future<Either<Failure, void>> userNameUpdate(String newName) async =>
      await repository.userNameUpdate(newName);
  Future<Either<Failure, void>> userEmailUpdate(String newEmail) async =>
      await repository.userEmailUpdate(newEmail);
  Future<Either<Failure, Stream<User?>>> authStateChanges() async =>
      await repository.authStateChanges();
  Future<Either<Failure, UserData>> getUserData() async =>
      await repository.getUserData();
  Future<Either<Failure, void>> userPhoneUpdate(String newPhone) async =>
      await repository.userPhoneUpdate(newPhone);
  Future<Either<Failure, void>> verifyOTP(String otp) async =>
      await repository.verifyOTP(otp);
  Future<Either<Failure, void>> resendOTP(String phoneNumber) async =>
      await repository.resendOTP(phoneNumber);
  Future<Either<Failure, void>> userPasswordUpdate(String newPassword) async =>
      await repository.userPasswordUpdate(newPassword);
  Future<Either<Failure, void>> userDelete() async =>
      await repository.userDelete();
  Future<Either<Failure, void>> userPhoneUpdateDB(String newPhone) async =>
      await repository.userPhoneUpdateDB(newPhone);
}
