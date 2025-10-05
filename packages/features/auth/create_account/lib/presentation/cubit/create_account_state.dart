part of 'create_account_cubit.dart';

@immutable
sealed class CreateAccountState {}

final class CreateAccountInitial extends CreateAccountState {}

class Success extends CreateAccountState {}

// ignore: must_be_immutable
class Error extends CreateAccountState {
  Failure failure;
  Error(this.failure);
}

class Loading extends CreateAccountState {}

