import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login({
    required String email,
    required String password,
  });

  Future<User> register({
    required String email,
    required String password,
    required String fullName,
    required String username,
    required String phone,
    required String university,
  });

  Future<void> verifyOtp({
    required String email,
    required String otp,
  });

  Future<void> resendOtp({
    required String email,
  });

  Future<void> forgotPassword({
    required String email,
  });

  Future<void> logout();

  Future<User?> getCurrentUser();

  Future<bool> isLoggedIn();
}
