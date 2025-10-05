import 'package:dartz/dartz.dart';
import 'package:data/models/failure.dart';

abstract class ForgotPasswordDataSoure {
  Future<Either<Failure, void>> forgotPassword(String email);
}
