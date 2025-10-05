import 'package:create_account/data/data_source/data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/auth_model.dart';
import 'package:data/models/failure.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_handler.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/remote_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: DataSource)
class DataSourceImpl extends DataSource {
  RemoteManager remote;
  DataSourceImpl(this.remote);
  @override
  Future<Either<Failure, AuthResponse>> cereateAccount(AuthModel auth) async {
    try {
      final response = await remote.createAccount(
        email: auth.email,
        password: auth.password,
      );
      return Right(response);
    } on AuthException catch (authError) {
      return left(AuthErrorHandler.handelError(authError));
    } catch (e) {
      print('from dataSource error');
      print(e);
      return Left(Failure(code: e.toString(), message: e.toString()));
    }
  }
}
