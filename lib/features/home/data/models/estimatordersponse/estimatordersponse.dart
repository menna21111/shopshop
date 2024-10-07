import 'data.dart';

class Estimatordersponse {
  bool? status;
  dynamic message;
  Dataestm? data;

  Estimatordersponse({this.status, this.message, this.data});

  factory Estimatordersponse.fromJson(Map<String, dynamic> json) {
    return Estimatordersponse(
      status: json['status'] as bool?,
      message: json['message'] as dynamic,
      data: json['data'] == null
          ? null
          : Dataestm.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
