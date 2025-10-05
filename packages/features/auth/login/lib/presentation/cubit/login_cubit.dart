import 'package:data/models/auth_model.dart';
import 'package:data/models/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:login/domain/usecase/login_use_case.dart';

part 'login_state.dart';

@lazySingleton
class LoginCubit extends Cubit<LoginState> {
  LoginUseCase usecase;
  LoginCubit(this.usecase) : super(LoginInitial());
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  Future<void> login(AuthModel auth) async {
    emit(Loading());
    final result = await usecase.loginCall(auth);
    result.fold(
      (failure) {
        emit(Error(failure));
        print(failure.code);
        print(failure.message);
      },
      (suc) {
        emit(Success());
      },
    );
  }
}
