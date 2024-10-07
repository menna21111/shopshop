import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final bool status;
  final String? message;
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  const UserModel({
    required this.status,
    required this.message,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json['status'],
      message: json['message'] ?? null,
      id: json['data']['id'],
      name: json['data']['name'],
      email: json['data']['email'],
      phone: json['data']['phone'],
      image: json['data']['image'],
      points: json['data']['points'],
      credit: json['data']['credit'],
      token: json['data']['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        'points': points,
        'credit': credit,
        'token': token,
      },
    };
  }

  @override
  List<Object?> get props => [
        status,
        message,
        id,
        name,
        email,
        phone,
        image,
        points,
        credit,
        token,
      ];
}
