part of 'user_details_cubit.dart';

@immutable
sealed class UserDetailsState {}

final class UserDetailsInitial extends UserDetailsState {}

class UserDetailsGStopLoading extends UserDetailsState {}

class UserDetailsGError extends UserDetailsState {
  final Failure failure;
  UserDetailsGError(this.failure);
}

class SendEmailVerificationStateError extends UserDetailsState {
  final Failure failure;
  SendEmailVerificationStateError(this.failure);
}

class EmailVerified extends UserDetailsState {}

class EmailVerificationSend extends UserDetailsState {}

class PhoneVerified extends UserDetailsState {}

class PhoneVerificationSend extends UserDetailsState {}
// class PhoneVerificationResend extends UserDetailsState {}

class PhoneVerificationSendingLoading extends UserDetailsState {}

class PhoneVerificationSubmittingInProgress extends UserDetailsState {}

class PhoneVerificationError extends UserDetailsState {
  final Failure failure;
  PhoneVerificationError(this.failure);
}

class ConfirmDetails extends UserDetailsState {}
class ConfirmDetailsLoading extends UserDetailsState {}
class MainLoading extends UserDetailsState {}
