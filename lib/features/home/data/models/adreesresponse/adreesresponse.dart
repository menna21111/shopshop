import 'data.dart';

class Adreesresponse {
  bool? status;
  String? message;
  Data? data;

  Adreesresponse({this.status, this.message, this.data});

  factory Adreesresponse.fromJson(Map<String, dynamic> json) {
    return Adreesresponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
