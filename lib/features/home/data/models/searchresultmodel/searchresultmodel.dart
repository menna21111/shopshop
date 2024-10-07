import 'data.dart';

class Searchresultmodel {
  bool? status;
  dynamic message;
  Data? data;

  Searchresultmodel({this.status, this.message, this.data});

  factory Searchresultmodel.fromJson(Map<String, dynamic> json) {
    return Searchresultmodel(
      status: json['status'] as bool?,
      message: json['message'] as dynamic,
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
