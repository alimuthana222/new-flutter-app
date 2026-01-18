import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_service.dart';

class AuthService {
  final _auth = SupabaseService.auth;

  // Sign up with email
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String fullName,
    required String username,
    String? phone,
    String? university,
  }) async {
    final response = await _auth.signUp(
      email: email,
      password: password,
      data: {
        'full_name': fullName,
        'username': username,
        'phone': phone,
        'university': university,
      },
    );
    return response;
  }

  // Sign in with email
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  // Sign in with Google
  Future<bool> signInWithGoogle() async {
    final response = await _auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: 'io.supabase.maharat://login-callback/',
    );
    return response;
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    await _auth.resetPasswordForEmail(email);
  }

  // Verify OTP
  Future<AuthResponse> verifyOTP({
    required String email,
    required String token,
  }) async {
    final response = await _auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.signup,
    );
    return response;
  }

  // Update password
  Future<UserResponse> updatePassword(String newPassword) async {
    final response = await _auth.updateUser(
      UserAttributes(password: newPassword),
    );
    return response;
  }

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Auth state stream
  Stream<AuthState> get authStateChanges => _auth.onAuthStateChange;
}
