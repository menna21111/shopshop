import 'package:shopshop/features/home/data/models/orderdetails/data.dart';

class OrderDetails {
  bool? status;
  dynamic message;
  DataOrderDetails? data;

  OrderDetails({this.status, this.message, this.data});

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : DataOrderDetails.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
