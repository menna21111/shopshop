class Datumnot {
  int? id;
  String? title;
  String? message;

  Datumnot({this.id, this.title, this.message});

  factory Datumnot.fromJson(Map<String, dynamic> json) => Datumnot(
        id: json['id'] as int?,
        title: json['title'] as String?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'message': message,
      };
}
