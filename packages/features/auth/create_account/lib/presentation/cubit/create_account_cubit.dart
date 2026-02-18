import 'package:create_account/domain/use_case/create_account_use_case.dart';
import 'package:data/models/auth/auth_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'create_account_state.dart';

@injectable
class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountUseCase useCase;
  CreateAccountCubit(this.useCase) : super(CreateAccountInitial());
  static CreateAccountCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void login(AuthModel auth) async {
    emit(Loading());
    final result = await useCase.createAccount(auth);
    result.fold(
      (failure) {
        emit(Error(failure));
        // debugPrint('fail');

        // debugPrint(failure.code);
        // debugPrint(failure.message);
      },
      (suc) {
        emit(Success());
        // debugPrint(suc.credential.toString());
      },
    );
  }
}
