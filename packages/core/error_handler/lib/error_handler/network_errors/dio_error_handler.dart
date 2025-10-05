

// import 'package:domain/models/failure.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class ErrorHandler implements Exception {
//   late Failure failure;

//   ErrorHandler.handleError(dynamic error) {
//     if(error is AuthException) {
//       failure = handleError(error);
//     } else {
//       failure = DataSource.defaultError.getFailure();
//     }
//   }
// }

// Failure handleError(DioException error) {
//   switch (error.type) {
//     case DioExceptionType.connectionTimeout:
//       return DataSource.connectTimeOut.getFailure();
//     case DioExceptionType.sendTimeout:
//       return DataSource.sendTimeout.getFailure();
//     case DioExceptionType.receiveTimeout:
//       return DataSource.recivedTimeout.getFailure();
//     case DioExceptionType.badCertificate:
//       return DataSource.defaultError.getFailure();
//     case DioExceptionType.badResponse:
//       return DataSource.defaultError.getFailure();
//     case DioExceptionType.cancel:
//       return DataSource.cancelled.getFailure();
//     case DioExceptionType.connectionError:
//       return DataSource.connectTimeOut.getFailure();
//     default:
//       if (error.response != null &&
//           error.response?.statusCode != null &&
//           error.response?.statusMessage != null) {
//         return Failure(
//           code: error.response?.statusCode ?? 0,
//           message: error.response?.statusMessage ?? 'Unknown Error',
//         );
//       } else {
//         return DataSource.defaultError.getFailure();
//       }
//   }
// }
