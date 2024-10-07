import 'data.dart';

class Getcart {
  bool? status;
  dynamic message;
  Dataa? data;

  Getcart({this.status, this.message, this.data});

  factory Getcart.fromJson(Map<String, dynamic> json) => Getcart(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : Dataa.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
