import 'package:dartz/dartz.dart';
import 'package:data/models/auth_model.dart';
import 'package:data/models/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DataSource {
Future<Either<Failure, AuthResponse>> cereateAccount(AuthModel auth);
}
