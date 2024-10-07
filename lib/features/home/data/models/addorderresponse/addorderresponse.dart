import 'data.dart';

class Addorderresponse {
  bool? status;
  String? message;
  Data? data;

  Addorderresponse({this.status, this.message, this.data});

  factory Addorderresponse.fromJson(Map<String, dynamic> json) {
    return Addorderresponse(
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
