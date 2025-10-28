import 'package:dartz/dartz.dart';
import 'package:data/models/auth/auth_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:login/domain/repository/login_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class LoginUseCase {
  LoginRepo repo;
  LoginUseCase(this.repo);
  Future<Either<Failure, AuthResponse>> loginCall(AuthModel auth) =>
      repo.login(auth);
}
