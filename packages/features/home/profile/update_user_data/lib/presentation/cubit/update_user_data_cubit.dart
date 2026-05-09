import 'dart:async';
import 'package:cars_market/di/di.dart';
import 'package:cars_market/globle/globle.dart';
import 'package:data/models/failure/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:profile/presentation/cubit/profile_cubit.dart';
import 'package:update_user_data/domain/usecase/update_user_data_use_case.dart';

part 'update_user_data_state.dart';

@lazySingleton
class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  UpdateUserDataUseCase useCase;
  UpdateUserDataCubit(this.useCase) : super(UpdateUserDataInitial());
  String newPhoneNumber = '';
  static UpdateUserDataCubit get(BuildContext context) =>
      BlocProvider.of(context);
  Future<void> userNameUpdate(String newName) async {
    emit(UpdateUserDataLoading());
    final result = await useCase.userNameUpdate(newName);
    result.fold((failure) => emit(UpdateUserDataFailure(failure)), (_) {
      emit(UpdateUserDataSuccess());
      getIt.get<ProfileCubit>().updateProfileName();
    });
  }

  Future<void> userEmailUpdate(String newEmail) async {
    emit(UpdateUserDataLoading());
    final result = await useCase.userEmailUpdate(newEmail);
    result.fold((failure) => emit(UpdateUserDataFailure(failure)), (_) {
      emit(UpdateUserDataPending());
    });
  }

  Future<void> userPasswordUpdate(String newPassword) async {
    emit(UpdateUserDataLoading());
    final result = await useCase.userPasswordUpdate(newPassword);
    result.fold((failure) => emit(UpdateUserDataFailure(failure)), (_) {
      emit(UpdateUserDataSuccess());
    });
  }

  Future<void> sendUserPhoneUpdate(String newPhone) async {
    emit(UpdateUserDataLoading());
    final result = await useCase.userPhoneUpdate(newPhone);
    result.fold((failure) => emit(UpdateUserDataFailure(failure)), (_) {
      emit(PhoneVerificationSubmittingInProgress());
    });
  }

  Future<void> verifyOTP(String otp) async {
    emit(PhoneVerificationSubmittingInProgress());
    final result = await useCase.verifyOTP(otp);
    result.fold((failure) => emit(UpdateUserDataFailure(failure)), (_) async {
      final res = await useCase.getUserData();
      res.fold((failure) => emit(UpdateUserDataFailure(failure)), (data) async {
        userData = data;
        if (userData.phoneNumber == newPhoneNumber) {
          final res = await useCase.userPhoneUpdateDB(newPhoneNumber);
          res.fold((failure) => emit(UpdateUserDataFailure(failure)), (_) {
            emit(PhoneVerified());
          });
        }
      });
    });
  }

  Future<void> resendOTP() async {
    final result = await useCase.resendOTP(newPhoneNumber);
    result.fold((failure) => emit(UpdateUserDataFailure(failure)), (_) {});
  }

  Future<void> userDelete() async {
    emit(UpdateUserDataLoading());
    final result = await useCase.userDelete();
    result.fold((failure) => emit(UpdateUserDataFailure(failure)), (_) {
      emit(UserDataDeletedSuccess());
    });
  }
}
