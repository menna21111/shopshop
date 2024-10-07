class Dataestm {
  double? subTotal;
  double? discount;
  double? points;
  double? total;

  Dataestm({this.subTotal, this.discount, this.points, this.total});

  factory Dataestm.fromJson(Map<String, dynamic> json) => Dataestm(
        subTotal: (json['sub_total'] as num?)?.toDouble(),
        discount: (json['discount'] as num?)?.toDouble(),
        points: json['points'] as double?,
        total: (json['total'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'sub_total': subTotal,
        'discount': discount,
        'points': points,
        'total': total,
      };
}
