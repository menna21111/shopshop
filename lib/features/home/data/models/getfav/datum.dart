import 'product.dart';

class Datuwm {
  int? id;
  Product? product;

  Datuwm({this.id, this.product});

  factory Datuwm.fromJson(Map<String, dynamic> json) => Datuwm(
        id: json['id'] as int?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product?.toJson(),
      };
}
