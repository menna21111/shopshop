import 'data.dart';

class Addtocart {
  bool? status;
  String? message;
  Data? data;

  Addtocart({this.status, this.message, this.data});

  factory Addtocart.fromJson(Map<String, dynamic> json) => Addtocart(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
