import 'data.dart';

class Addtofav {
  bool? status;
  String? message;
  Data? data;

  Addtofav({this.status, this.message, this.data});

  factory Addtofav.fromJson(Map<String, dynamic> json) => Addtofav(
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
