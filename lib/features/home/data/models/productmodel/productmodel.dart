import 'data.dart';

class Productmodel {
  bool? status;
  dynamic message;
  Data? data;

  Productmodel({this.status, this.message, this.data});

  factory Productmodel.fromJson(Map<String, dynamic> json) => Productmodel(
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
