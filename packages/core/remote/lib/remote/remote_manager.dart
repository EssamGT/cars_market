import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@singleton
class RemoteManager {
  final Supabase supabase;
  RemoteManager(this.supabase);

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    return await supabase.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> createAccount({
    required String email,
    required String password,
  }) async {
    return await supabase.client.auth.signUp(email: email, password: password);
  }

  Future<void> logout() async {
    await supabase.client.auth.signOut(scope: SignOutScope.global);
  }

  Future<void> requestOTP(String email) async {
    await supabase.client.auth.verifyOTP(type: OtpType.email, email: email);
  }

  Future<void> forgotPassword(String email) async {
    await supabase.client.auth.resetPasswordForEmail(email);
  }
}
