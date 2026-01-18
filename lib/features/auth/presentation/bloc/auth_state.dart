import 'package:equatable/equatable.dart';
import '../../domain/entities/user.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class Authenticated extends AuthState {
  final User user;

  const Authenticated({required this.user});

  @override
  List<Object?> get props => [user];
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}

class OtpSent extends AuthState {
  final String email;

  const OtpSent({required this.email});

  @override
  List<Object?> get props => [email];
}

class OtpVerified extends AuthState {
  const OtpVerified();
}

class OtpResent extends AuthState {
  const OtpResent();
}

class PasswordResetSent extends AuthState {
  const PasswordResetSent();
}
