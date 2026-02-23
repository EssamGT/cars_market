part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

class Loading extends LocationState {}

class Error extends LocationState {
  final Failure errorMessage;
  Error(this.errorMessage);
}

class Success extends LocationState {
  final GoogleMapsEntity selectedLocation;
  Success(this.selectedLocation);
}
