class Setfcmtokenresponse {
  final bool? status;
  final String? message;
  final NotificationData? data;

  Setfcmtokenresponse({this.status, this.message, this.data});

  factory Setfcmtokenresponse.fromJson(Map<String, dynamic> json) {
    return Setfcmtokenresponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? NotificationData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class NotificationData {
  final String? token;
  final int? userId;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  NotificationData({
    this.token,
    this.userId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      token: json['token'] as String?,
      userId: json['user_id'] as int?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user_id': userId,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
