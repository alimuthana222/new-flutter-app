import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String fullName;
  final String? username;
  final String? phone;
  final String? university;
  final String? photoUrl;
  final String? bio;
  final int timeBalance;
  final DateTime createdAt;

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    this.username,
    this.phone,
    this.university,
    this.photoUrl,
    this.bio,
    this.timeBalance = 0,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        fullName,
        username,
        phone,
        university,
        photoUrl,
        bio,
        timeBalance,
        createdAt,
      ];
}
