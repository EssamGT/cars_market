part of 'on_bording_cubit_cubit.dart';

@immutable
sealed class OnBordingState {}

final class OnBordingCubitInitial extends OnBordingState {}

class NewImage extends OnBordingState {}
class Login extends OnBordingState {}
