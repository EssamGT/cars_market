part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class Success extends LoginState {}

class Loading extends LoginState {}

// ignore: must_be_immutable
class Error extends LoginState {
  Failure failure;
  Error(this.failure);
}
