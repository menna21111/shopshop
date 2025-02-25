import 'data.dart';

class HomeModel {
  bool? status;
  dynamic message;
  Dataa? data;

  HomeModel({this.status, this.message, this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
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
