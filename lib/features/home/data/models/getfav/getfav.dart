import 'data.dart';

class Getfav {
  bool? status;
  dynamic message;
  Data? data;

  Getfav({this.status, this.message, this.data});

  factory Getfav.fromJson(Map<String, dynamic> json) => Getfav(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
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
