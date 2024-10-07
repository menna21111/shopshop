class Data {
  String? paymentMethod;
  int? cost;
  int? vat;
  int? discount;
  int? points;
  int? total;
  int? id;

  Data({
    this.paymentMethod,
    this.cost,
    this.vat,
    this.discount,
    this.points,
    this.total,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paymentMethod: json['payment_method'] as String?,
        cost: (json['cost'] is int) ? json['cost'] as int? : (json['cost'] as double?)?.toInt(),
        vat: (json['vat'] is int) ? json['vat'] as int? : (json['vat'] as double?)?.toInt(),
        discount: (json['discount'] is int) ? json['discount'] as int? : (json['discount'] as double?)?.toInt(),
        points: (json['points'] is int) ? json['points'] as int? : (json['points'] as double?)?.toInt(),
        total: (json['total'] is int) ? json['total'] as int? : (json['total'] as double?)?.toInt(),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'payment_method': paymentMethod,
        'cost': cost,
        'vat': vat,
        'discount': discount,
        'points': points,
        'total': total,
        'id': id,
      };
}
