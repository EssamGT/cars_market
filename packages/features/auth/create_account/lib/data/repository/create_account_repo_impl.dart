import 'package:create_account/data/data_source/data_source.dart';
import 'package:create_account/domain/repository/create_account_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/auth/auth_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/base_errors/base_error_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/network_info/network_info.dart';

@LazySingleton(as: CreateAccountRepo)
class CreateAccountRepoImpl extends CreateAccountRepo {
  NetworkInfo networkInfo;
  DataSource dataSource;
  CreateAccountRepoImpl(this.networkInfo, this.dataSource);
  @override
  Future<Either<Failure, UserCredential>> createAccount(AuthModel auth) async {
    if (await networkInfo.isConnected) {
      return await dataSource.cereateAccount(auth);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }
}
