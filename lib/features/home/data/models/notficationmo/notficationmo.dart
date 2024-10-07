import 'data.dart';

class Notficationmo {
  bool? status;
  dynamic message;
  Datanot? data;

  Notficationmo({this.status, this.message, this.data});

  factory Notficationmo.fromJson(Map<String, dynamic> json) => Notficationmo(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : Datanot.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
