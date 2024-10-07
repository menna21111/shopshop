class Datumorder {
  int? id;
  double? total;
  String? date;
  String? status;

  Datumorder({this.id, this.total, this.date, this.status});

  factory Datumorder.fromJson(Map<String, dynamic> json) => Datumorder(
        id: json['id'] as int?,
        total: (json['total'] as num?)?.toDouble(),
        date: json['date'] as String?,
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'total': total,
        'date': date,
        'status': status,
      };
}
