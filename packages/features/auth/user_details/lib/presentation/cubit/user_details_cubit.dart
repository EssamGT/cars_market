import 'dart:async';
import 'package:cars_market/globle/globle.dart';
import 'package:data/models/failure/failure.dart';
import 'package:data/models/user/user_data.dart';
import 'package:data/models/user/user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:user_details/domain/usecase/user_details_use_case.dart';

part 'user_details_state.dart';

@injectable
class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsUseCase useCase;
  StreamSubscription<User?>? _sub;
  UserDetails userDetails = UserDetails();
  UserDetailsCubit(this.useCase) : super(UserDetailsInitial()) {
    _checkAuthOnce();
  }

  static UserDetailsCubit get(BuildContext context) =>
      BlocProvider.of<UserDetailsCubit>(context);
  @override
  Future<void> close() {
    stopListening();
    return super.close();
  }

  void _checkAuth({bool submit = false}) async {
    bool emailVerified = false;
    bool phoneVerified = false;
    final result = await useCase.getAuthStateChanges();
    result.fold(
      (failure) {
        emit(UserDetailsGError(failure));
      },
      (s) {
        final stream = s;

        _sub = stream.listen(
          (user) async {
            // print('auth event received: $user');
            // print(state);

            if (user != null) {
              await user.reload();
              if (submit) {
                if (user.phoneNumber != null &&
                    user.emailVerified &&
                    user.displayName != null) {
                  userData = UserData(
                    id: user.uid,
                    name: user.displayName ?? '',
                    email: user.email ?? '',
                    phoneNumber: user.phoneNumber ?? '',

                    verifiedEmail: user.emailVerified,
                    createdAt: DateTime.now().toIso8601String(),
                    favoriteCarsIds: [],
                    listedCarsIds: [],
                  );
                  final res = await useCase.setUserData(userData);
                  res.fold(
                    (failure) {
                      emit(UserDetailsGError(failure));
                    },
                    (_) {
                      emit(ConfirmDetails());
                    },
                  );
                  stopListening();
                  return;
                }
              }

              if (user.phoneNumber != null &&
                  user.emailVerified &&
                  user.displayName != null) {
                stopListening();
              }
              if (user.phoneNumber != null && !phoneVerified) {
                userDetails.phoneNumber = user.phoneNumber ?? '';
                // print(userDetails.phoneNumber);
                phoneVerified = true;
                emit(PhoneVerified());
              }
              if (user.emailVerified && !emailVerified) {
                if (user.displayName != null) {
                  userDetails.name = user.displayName ?? '';
                }
                emailVerified = true;
                emit(EmailVerified());
              }
            }
            // emit(UserDetailsGStopLoading());
          },
          onDone: () {
            print('Auth state changes stream done');
          },
          onError: (error) {
            emit(
              UserDetailsGError(
                Failure(code: error.toString(), message: error.toString()),
              ),
            );
          },
        );
      },
    );
  }

  void _checkEmailAuth() async {
    bool emailVerified = false;
    final result = await useCase.getAuthStateChanges();
    result.fold(
      (failure) {
        emit(UserDetailsGError(failure));
      },
      (s) {
        final stream = s;

        _sub = stream.listen(
          (user) async {
            if (user != null) {
              await user.reload();
              print('dada');

              if (user.emailVerified && !emailVerified) {
                if (user.displayName != null) {
                  userDetails.name = user.displayName ?? '';
                }
                emailVerified = true;
                emit(EmailVerified());
                stopListening();
              }
            }
            // emit(UserDetailsGStopLoading());
          },
          onDone: () {
            print('Auth state changes stream done');
          },
          onError: (error) {
            emit(
              UserDetailsGError(
                Failure(code: error.toString(), message: error.toString()),
              ),
            );
          },
        );
      },
    );
  }

  void _checkAuthOnce() async {
    bool emailVerified = false;
    bool phoneVerified = false;
    final result = await useCase.getAuthStateChanges();
    result.fold(
      (fail) {
        emit(UserDetailsGError(fail));
      },
      (s) {
        final stream = s;
        stream.listen((user) async {
          print("aaaaaaallllllalal");
          if (user == null) {
            emit(UserDetailsGStopLoading());
          }
          if (state is UserDetailsInitial) {
            emit(UserDetailsGStopLoading());
          }
          if (user!.emailVerified) {
            print(user.emailVerified);
            emit(EmailVerified());
          }
          if (user.phoneNumber != null) {
            emit(PhoneVerified());
          }
          if (user.displayName != null) {
            userDetails.name = user.displayName ?? '';
          }
        });
      },
    );
  }

  void stopListening() {
    _sub?.cancel();
  }

  void sendEmailVerification() async {
    await updateName(userDetails.name);
    final result = await useCase.sendEmailVerification();
    result.fold(
      (failure) {
        emit(SendEmailVerificationStateError(failure));
      },
      (r) {
        emit(EmailVerificationSend());
        Future.delayed(Duration(seconds: 5), () {
          _checkEmailAuth();
        });
      },
    );
  }

  Future<void> updateName(String name) async {
    final result = await useCase.updateName(name);
    result.fold(
      (failure) {
        emit(UserDetailsGError(failure));
      },
      (r) {
        if (kDebugMode) {
          print('Name updated successfully');
        }
      },
    );
  }

  void sendOTP(String phoneNumber) async {
    emit(PhoneVerificationSendingLoading());
    final response = await useCase.sendOTP(phoneNumber);
    response.fold(
      (failure) {
        emit(PhoneVerificationError(failure));
      },
      (r) {
        userDetails.phoneNumber = phoneNumber;
        emit(PhoneVerificationSend());
      },
    );
  }

  void resendOTP() async {
    final response = await useCase.resendOTP(userDetails.phoneNumber);
    response.fold(
      (failure) {
        emit(PhoneVerificationError(failure));
      },
      (r) {
        print('otp resent');
      },
    );
  }

  void verifyOTP(String otp) async {
    emit(PhoneVerificationSubmittingInProgress());
    final result = await useCase.verifyOTP(otp);
    result.fold((failure) {
      emit(PhoneVerificationError(failure));
    }, (_) {});
  }

  void setUserName(String name) {
    userDetails.name = name;
  }

  void setUserPhoneNumber(String phone) {
    userDetails.phoneNumber = phone;
  }

  void setUserImage(XFile image) {
    userDetails.profilePic = image;
  }

  void confirmUserDetails() {
    _checkAuth(submit: true);
  }
}
