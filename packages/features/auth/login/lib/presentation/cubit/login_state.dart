part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class Loading extends LoginState {}

class SuccessToUserDetails extends LoginState {}

class SuccessToHome extends LoginState {}

// ignore: must_be_immutable
class Error extends LoginState {
  Failure failure;
  Error(this.failure);
}
