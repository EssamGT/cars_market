import 'package:dartz/dartz.dart';
import 'package:data/models/auth/auth_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:login/data/data_source.dart';
import 'package:login/domain/repository/login_repo.dart';
import 'package:remote/network_info/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: LoginRepo)
class LoginRepoImpl extends LoginRepo {
  LoginDataSource dataSource;
  NetworkInfo networkInfo;
  LoginRepoImpl(this.dataSource, this.networkInfo);
  @override
  Future<Either<Failure, AuthResponse>> login(AuthModel auth) async {
    if (await networkInfo.isConnected) {
      return await dataSource.login(auth);
    } else {
      return Left(Failure(code: 'noINternet', message: 'noINternet'));
    }
  }
}
