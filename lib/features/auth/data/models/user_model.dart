import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.fullName,
    super.username,
    super.phone,
    super.university,
    super.photoUrl,
    super.bio,
    super.timeBalance,
    required super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      university: json['university'] as String?,
      photoUrl: json['photo_url'] as String?,
      bio: json['bio'] as String?,
      timeBalance: (json['time_balance'] as int?) ?? 0,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'username': username,
      'phone': phone,
      'university': university,
      'photo_url': photoUrl,
      'bio': bio,
      'time_balance': timeBalance,
      'created_at': createdAt.toIso8601String(),
    };
  }

  User toEntity() {
    return User(
      id: id,
      email: email,
      fullName: fullName,
      username: username,
      phone: phone,
      university: university,
      photoUrl: photoUrl,
      bio: bio,
      timeBalance: timeBalance,
      createdAt: createdAt,
    );
  }
}
