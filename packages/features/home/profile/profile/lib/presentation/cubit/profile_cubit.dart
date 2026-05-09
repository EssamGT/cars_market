import 'package:cars_market/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/auth/auth_manager.dart';

part 'profile_state.dart';

@lazySingleton
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
static  ProfileCubit get(BuildContext context) => BlocProvider.of(context);
  void updateProfileName() {
    emit(ProfileNameUpdate());
  }

  void logOut() async {
    getIt.get<AuthManager>().logout();
    restGetIt();
  }
}
