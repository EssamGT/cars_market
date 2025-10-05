import 'package:data/models/failure.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgot_password/domain/usecase/forgot_password_use_case.dart';
import 'package:injectable/injectable.dart';

part 'forgot_password_state.dart';

@lazySingleton
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordUseCase useCase;
  ForgotPasswordCubit(this.useCase) : super(ForgotPasswordInitial());
static  ForgotPasswordCubit get(BuildContext context) => BlocProvider.of(context);
  Future<void> forgotPassword(String email) async {
    emit(Loading());
    final result = await useCase.forgotPasswordCall(email);
    result.fold(
      (failure) {
        emit(Error(failure));
      },
      (suc) {
        emit(Success());
      },
    );
  }
}
