import 'package:create_account/domain/repository/create_account_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/auth/auth_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateAccountUseCase {
  CreateAccountRepo repo;
  CreateAccountUseCase(this.repo);
  Future<Either<Failure, UserCredential>> createAccount(AuthModel auth) =>
      repo.createAccount(auth);
}
