import 'data.dart';

class Getordermodel {
  bool? status;
  dynamic message;
  Data? data;

  Getordermodel({this.status, this.message, this.data});

  factory Getordermodel.fromJson(Map<String, dynamic> json) => Getordermodel(
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
