import 'data.dart';

class Signupmodel {
  bool? status;
  String? message;
  Data? data;

  Signupmodel({this.status, this.message, this.data});

  factory Signupmodel.fromJson(Map<String, dynamic> json) => Signupmodel(
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
