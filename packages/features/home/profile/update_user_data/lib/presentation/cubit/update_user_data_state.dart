part of 'update_user_data_cubit.dart';

@immutable
sealed class UpdateUserDataState {}

final class UpdateUserDataInitial extends UpdateUserDataState {}

final class UpdateUserDataLoading extends UpdateUserDataState {}

final class UpdateUserDataPending extends UpdateUserDataState {}

final class UpdateUserDataSuccess extends UpdateUserDataState {}

final class PhoneVerificationSubmittingInProgress extends UpdateUserDataState {}

final class PhoneVerificationError extends UpdateUserDataState {
  final Failure failure;
  PhoneVerificationError(this.failure);
}

final class PhoneVerified extends UpdateUserDataState {}

final class UpdateUserDataFailure extends UpdateUserDataState {
  final Failure failure;
  UpdateUserDataFailure(this.failure);
}
