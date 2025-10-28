import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_handler.dart';
import 'package:forgot_password/data/data_source/forgot_password_data_soure.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/remote_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: ForgotPasswordDataSoure)
class ForgotPasswordDataSourceImpl extends ForgotPasswordDataSoure {
  RemoteManager remoteManager;
  ForgotPasswordDataSourceImpl(this.remoteManager);
  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      final response = await remoteManager.forgotPassword(email);
      return Right(response);
    } on AuthException catch (error) {
      return Left(AuthErrorHandler.handelError(error));
    } catch (e) {
      return Left(Failure(code: e.toString(), message: e.toString()));
    }
  }
}
