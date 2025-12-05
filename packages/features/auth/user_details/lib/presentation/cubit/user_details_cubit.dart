import 'dart:async';
import 'package:data/models/failure/failure.dart';
import 'package:data/models/user/user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:user_details/domain/usecase/user_deatils_use_case.dart';

part 'user_details_state.dart';

enum AuthCheckType { phone, lPhone, lEmail, email, allOnce }

@lazySingleton
class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDeatilsUseCase useCase;
  StreamSubscription<User?>? _sub;
  // Timer? _timer;
  UserDetails userDetails = UserDetails();
  // final Duration checkInterval = const Duration(seconds: 2);
  UserDetailsCubit(this.useCase) : super(UserDetailsInitial()) {
    _checkAuth();
  }

  static UserDetailsCubit get(context) =>
      BlocProvider.of<UserDetailsCubit>(context);
  @override
  Future<void> close() {
    stopListening();
    return super.close();
  }
  // void startListeningOnAuth() async {
  //   // emit(EmailVerifyingPending());
  //   _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
  //     final result = await useCase.getAuthStateChanges();
  //     result.fold(
  //       (failure) {
  //         emit(UserDetailsGError(failure));
  //       },
  //       (s) {
  //         final stream = s.isBroadcast ? s : s.asBroadcastStream();
  //         _sub = stream.listen(
  //           (user) async {
  //             print('auth event received: $user');
  //             if (user == null) {
  //               // emit(UserDeatilsStateIdle()); // example for sign-out
  //               return;
  //             } else {
  //               await user.reload();
  //               print('dada');

  //               if (user.phoneNumber != null) {
  //                 userDetails.phoneNumber = user.phoneNumber ?? '';
  //                 print(userDetails.phoneNumber);
  //                 emit(PhoneVerified());
  //               }
  //               if (user.emailVerified) {
  //                 emit(EmailVerified());
  //               }
  //               if (user.displayName != null) {
  //                 userDetails.name = user.displayName ?? '';
  //               }
  //               emit(UserDetailsGStopLoading());
  //             }
  //           },
  //           onDone: () {
  //             print('Auth state changes stream done');
  //           },
  //           onError: (error) {
  //             emit(
  //               UserDetailsGError(
  //                 Failure(code: error.toString(), message: error.toString()),
  //               ),
  //             );
  //           },
  //         );
  //       },
  //     );
  //   });
  // }

  // void checkAuthStatus(AuthCheckType type) {
  //   switch (type) {
  //     case AuthCheckType.phone:
  //       _checkOnPhone();
  //       break;
  //     case AuthCheckType.email:
  //       _checkOnEmail();
  //       break;
  //     case AuthCheckType.lPhone:
  //       _checkOnPhone(listen: true);
  //       break;
  //     case AuthCheckType.lEmail:
  //       _checkOnEmail(listen: true);
  //       break;
  //     case AuthCheckType.allOnce:
  //       _checkAuth();
  //       break;
  //   }
  // }

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

            if (user == null) {
              // emit(UserDeatilsStateIdle()); // example for sign-out
              stopListening();
              emit(UserDetailsGStopLoading());

              return;
            } else {
              await user.reload();
              print('dada');
              if (submit) {
                if (user.phoneNumber != null &&
                    user.emailVerified &&
                    user.displayName != null) {
                  emit(ConfirmDetails());
                  stopListening();
                  return;
                }
              }
              if (state is UserDetailsInitial) {
                emit(UserDetailsGStopLoading());
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

  // void _checkOnPhone({bool listen = false}) async {
  //   if (listen) {
  //     _timer = Timer.periodic(checkInterval, (_) async {
  //       final result = await useCase.getAuthStateChanges();
  //       result.fold(
  //         (failure) {
  //           emit(UserDetailsGError(failure));
  //         },
  //         (s) {
  //           final stream = s.isBroadcast ? s : s.asBroadcastStream();
  //           _sub = stream.listen(
  //             (user) async {
  //               print('auth event received phone : ${user?.phoneNumber}');
  //               if (user == null) {
  //                 // emit(UserDeatilsStateIdle()); // example for sign-out
  //                 stopListening();

  //                 return;
  //               } else {
  //                 await user.reload();
  //                 if (user.phoneNumber != null) {
  //                   userDetails.phoneNumber = user.phoneNumber ?? '';
  //                   // print(userDetails.phoneNumber);
  //                   emit(PhoneVerified());
  //                   stopListening();
  //                 }
  //               }
  //             },
  //             onDone: () {
  //               print('Auth state changes stream done');
  //             },

  //             onError: (error) {
  //               emit(
  //                 UserDetailsGError(
  //                   Failure(code: error.toString(), message: error.toString()),
  //                 ),
  //               );
  //             },
  //           );
  //         },
  //       );
  //     });
  //   } else {
  //     final result = await useCase.getAuthStateChanges();
  //     result.fold(
  //       (failure) {
  //         emit(UserDetailsGError(failure));
  //       },
  //       (s) {
  //         final stream = s.isBroadcast ? s : s.asBroadcastStream();
  //         _sub = stream.listen(
  //           (user) async {
  //             print('auth event received phone : ${user?.phoneNumber}');
  //             if (user == null) {
  //               // emit(UserDeatilsStateIdle()); // example for sign-out
  //               stopListening();
  //               return;
  //             } else {
  //               await user.reload();
  //               if (user.phoneNumber != null) {
  //                 userDetails.phoneNumber = user.phoneNumber ?? '';
  //                 // print(userDetails.phoneNumber);
  //                 emit(PhoneVerified());
  //                 stopListening();
  //               }
  //             }
  //           },
  //           onDone: () {
  //             print('Auth state changes stream done');
  //           },

  //           onError: (error) {
  //             emit(
  //               UserDetailsGError(
  //                 Failure(code: error.toString(), message: error.toString()),
  //               ),
  //             );
  //           },
  //         );
  //       },
  //     );
  //   }
  // }

  // void _checkOnEmail({bool listen = false}) async {
  //   if (listen) {
  //     _timer = Timer.periodic(checkInterval, (_) async {
  //       final result = await useCase.getAuthStateChanges();
  //       result.fold(
  //         (failure) {
  //           emit(UserDetailsGError(failure));
  //         },
  //         (s) {
  //           final stream = s.isBroadcast ? s : s.asBroadcastStream();
  //           _sub = stream.listen(
  //             (user) async {
  //               print('auth event received email : ${user?.emailVerified}');
  //               // print('auth event received: $user');

  //               if (user == null) {
  //                 // emit(UserDeatilsStateIdle()); // example for sign-out
  //                 stopListening();
  //                 return;
  //               } else {
  //                 await user.reload();
  //                 if (user.emailVerified) {
  //                   if (user.displayName != null) {
  //                     userDetails.name = user.displayName ?? '';
  //                   }
  //                   emit(EmailVerified());
  //                   print('noooo ya   ');
  //                   stopListening();
  //                 }
  //               }
  //             },
  //             onDone: () {
  //               print('Auth state changes stream done');
  //             },

  //             onError: (error) {
  //               emit(
  //                 UserDetailsGError(
  //                   Failure(code: error.toString(), message: error.toString()),
  //                 ),
  //               );
  //             },
  //           );
  //         },
  //       );
  //     });
  //   } else {
  //     final result = await useCase.getAuthStateChanges();
  //     result.fold(
  //       (failure) {
  //         emit(UserDetailsGError(failure));
  //       },
  //       (s) {
  //         final stream = s.isBroadcast ? s : s.asBroadcastStream();
  //         _sub = stream.listen(
  //           (user) async {
  //             print('auth event received email : ${user?.emailVerified}');
  //             if (user == null) {
  //               // emit(UserDeatilsStateIdle()); // example for sign-out
  //               stopListening();
  //               return;
  //             } else {
  //               await user.reload();
  //               if (user.emailVerified) {
  //                 if (user.displayName != null) {
  //                   userDetails.name = user.displayName ?? '';
  //                 }
  //                 emit(EmailVerified());
  //                 stopListening();
  //               }
  //             }
  //           },
  //           onDone: () {
  //             print('Auth state changes stream done');
  //           },

  //           onError: (error) {
  //             emit(
  //               UserDetailsGError(
  //                 Failure(code: error.toString(), message: error.toString()),
  //               ),
  //             );
  //           },
  //         );
  //       },
  //     );
  //   }
  // }

  void stopListening() {
    _sub?.cancel();
    // if (_timer != null) {
    //   _timer?.cancel();
    // }
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
        // checkAuthStatus(AuthCheckType.lEmail);
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
        // emit(());
        // checkAuthStatus(AuthCheckType.email);
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
        emit(PhoneVerificationSend());
      },
    );
  }
  void resendOTP() async {
    // emit(PhoneVerificationSendingLoading());
    final response = await useCase.resendOTP(userDetails.phoneNumber);
    response.fold(
      (failure) {
        emit(PhoneVerificationError(failure));
      },
      (r) {
        // emit(PhoneVerificationSend());
        print('otp resent');
      },
    );
  }

  void verifyOTP(String otp) async {
    emit(PhoneVerificationSubmittingInProgress());
    final result = await useCase.verifyOTP(otp);
    result.fold(
      (failure) {
        emit(PhoneVerificationError(failure));
      },
      (_) {
        // emit(PhoneVerified());
        // checkAuthStatus(AuthCheckType.lPhone);
      },
    );
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
