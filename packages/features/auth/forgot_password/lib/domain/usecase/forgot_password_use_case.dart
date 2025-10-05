import 'package:dartz/dartz.dart';
import 'package:data/models/failure.dart';
import 'package:forgot_password/domain/repository/forgot_password_repo.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class ForgotPasswordUseCase {
  ForgotPasswordRepo repo;
  ForgotPasswordUseCase(this.repo);
  Future<Either<Failure, void>> forgotPasswordCall(String email) =>
      repo.forgotPassword(email);
}
