class erormodel {
  final bool status;
  final String message;
  final dynamic? data;

  erormodel({
    required this.status,
    required this.message,
    this.data,
  });

  factory erormodel.fromJson(Map<String, dynamic> json) {
    return erormodel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data,
    };
  }
}
