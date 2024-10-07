import 'datum.dart';

class BannerModel {
  bool? status;
  dynamic message;
  List<Datum>? data;

  BannerModel({this.status, this.message, this.data});

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
