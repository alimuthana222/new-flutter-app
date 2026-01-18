import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SharedPreferences sharedPreferences;
  final FlutterSecureStorage secureStorage;

  AuthRepositoryImpl({
    required this.sharedPreferences,
    required this.secureStorage,
  });

  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // For demo purposes, create a mock user
    final user = UserModel(
      id: '1',
      email: email,
      fullName: 'مستخدم تجريبي',
      username: 'test_user',
      phone: '07901234567',
      university: 'جامعة بغداد',
      timeBalance: 10,
      createdAt: DateTime.now(),
    );

    // Save login state
    await sharedPreferences.setBool('is_logged_in', true);
    await secureStorage.write(key: 'user_id', value: user.id);
    await secureStorage.write(key: 'user_email', value: user.email);

    return user;
  }

  @override
  Future<User> register({
    required String email,
    required String password,
    required String fullName,
    required String username,
    required String phone,
    required String university,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // For demo purposes, create a mock user
    final user = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      fullName: fullName,
      username: username,
      phone: phone,
      university: university,
      timeBalance: 5, // Welcome bonus
      createdAt: DateTime.now(),
    );

    // Save user data but don't set logged in until OTP is verified
    await secureStorage.write(key: 'pending_user_id', value: user.id);
    await secureStorage.write(key: 'pending_user_email', value: user.email);

    return user;
  }

  @override
  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // For demo purposes, accept any 6-digit OTP
    if (otp.length == 6) {
      // Move pending user to logged in state
      final userId = await secureStorage.read(key: 'pending_user_id');
      final userEmail = await secureStorage.read(key: 'pending_user_email');

      await sharedPreferences.setBool('is_logged_in', true);
      await secureStorage.write(key: 'user_id', value: userId);
      await secureStorage.write(key: 'user_email', value: userEmail);

      // Clean up pending data
      await secureStorage.delete(key: 'pending_user_id');
      await secureStorage.delete(key: 'pending_user_email');
    } else {
      throw Exception('رمز التحقق غير صحيح');
    }
  }

  @override
  Future<void> resendOtp({
    required String email,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    // In a real app, this would trigger sending a new OTP
  }

  @override
  Future<void> forgotPassword({
    required String email,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    // In a real app, this would send a password reset email
  }

  @override
  Future<void> logout() async {
    await sharedPreferences.setBool('is_logged_in', false);
    await secureStorage.delete(key: 'user_id');
    await secureStorage.delete(key: 'user_email');
  }

  @override
  Future<User?> getCurrentUser() async {
    final isLoggedIn = await this.isLoggedIn();
    if (!isLoggedIn) return null;

    final userId = await secureStorage.read(key: 'user_id');
    final userEmail = await secureStorage.read(key: 'user_email');

    if (userId == null || userEmail == null) return null;

    // In a real app, fetch user data from API
    return UserModel(
      id: userId,
      email: userEmail,
      fullName: 'مستخدم تجريبي',
      username: 'test_user',
      phone: '07901234567',
      university: 'جامعة بغداد',
      timeBalance: 10,
      createdAt: DateTime.now(),
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    return sharedPreferences.getBool('is_logged_in') ?? false;
  }
}
