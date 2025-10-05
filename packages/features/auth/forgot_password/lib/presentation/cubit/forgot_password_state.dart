part of 'forgot_password_cubit.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

class Success extends ForgotPasswordState {}

class Loading extends ForgotPasswordState {}

// ignore: must_be_immutable
class Error extends ForgotPasswordState {
  Failure failure;
  Error(this.failure);
}
