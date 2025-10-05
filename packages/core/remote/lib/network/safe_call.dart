import 'package:dartz/dartz.dart';
import 'package:data/models/failure.dart';
import 'package:error_handler/error_handler/network_errors/data_source.dart';
import 'package:error_handler/error_handler/network_errors/data_source_extensions.dart';
import 'package:remote/network_info/network_info.dart';

Future<Either<Failure, T>> safeCall<T>(
  NetworkInfo networkinfo,
  Future<T> Function() call,
) async {
  if (await networkinfo.isConnected) {
    final response = await call();
    return Right(response);
  } else {
    return Left(DataSource.noInternetConnection.getFailure());
  }
}
