import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final bool? status;
  final String? message;
  final UserResponse? data;

  const LoginModel({
    this.status,
    this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? UserResponse.fromJson(json['data']) : null,
    );
  }

  @override
  List<Object?> get props => [status, message, data];
}

class UserResponse extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;
  final int points;
  final int credit;

  UserResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
    required this.points,
    required this.credit,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      token: json['token'] ?? '',
      points: (json['points'] is int) ? json['points'] : (json['points'] as double?)?.toInt() ?? 0,
      credit: (json['credit'] is int) ? json['credit'] : (json['credit'] as double?)?.toInt() ?? 0,
    );
  }

  @override
  List<Object?> get props => [id, name, email, phone, image, token, points, credit];
}
