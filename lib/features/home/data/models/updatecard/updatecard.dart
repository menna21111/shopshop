import 'data.dart';

class Updatecard {
  bool? status;
  String? message;
  Dataupdate? data;

  Updatecard({this.status, this.message, this.data});

  factory Updatecard.fromJson(Map<String, dynamic> json) => Updatecard(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Dataupdate.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
