import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'on_bording_cubit_state.dart';

class OnBordingCubit extends Cubit<OnBordingState> {
  OnBordingCubit() : super(OnBordingCubitInitial());
  static OnBordingCubit get(BuildContext context) => BlocProvider.of(context);
  int index = 0;
  void changeImage(int lenght) {
    if (index < lenght - 1) {
      index++;
    } else {
      emit(Login());
    }
    emit(NewImage());
  }
}
