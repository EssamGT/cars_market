import 'package:dartz/dartz.dart';
import 'package:data/models/auth_model.dart';
import 'package:data/models/failure.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_handler.dart';
import 'package:injectable/injectable.dart';
import 'package:login/data/data_source.dart';
import 'package:remote/remote/remote_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: LoginDataSource)
class DataSourceImpl extends LoginDataSource {
  RemoteManager remote;
  DataSourceImpl(this.remote);
  @override
  Future<Either<Failure, AuthResponse>> login(AuthModel auth) async {
    try {
      final response = await remote.login(
        email: auth.email,
        password: auth.password,
      );
      return Right(response);
    } on AuthException catch (error) {
      return Left(AuthErrorHandler.handelError(error));
    } catch (e) {
      return Left(Failure(code: e.toString(), message: e.toString()));
    }
  }
}
