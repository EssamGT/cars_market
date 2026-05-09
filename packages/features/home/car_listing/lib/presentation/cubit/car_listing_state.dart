part of 'car_listing_cubit.dart';

@immutable
sealed class CarListingState {}

final class CarListingInitial extends CarListingState {}

final class UserDataLoading extends CarListingState {}

final class UserDataLoaded extends CarListingState {
  final UserData userData;
  UserDataLoaded({required this.userData});
}

final class UserDataError extends CarListingState {
  final Failure failure;
  UserDataError({required this.failure});
}
