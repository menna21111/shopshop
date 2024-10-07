import 'cart.dart';

class Dataupdate {
  Cart? cart;
  double? subTotal;
  double? total;

  Dataupdate({this.cart, this.subTotal, this.total});

  factory Dataupdate.fromJson(Map<String, dynamic> json) => Dataupdate(
        cart: json['cart'] == null
            ? null
            : Cart.fromJson(json['cart'] as Map<String, dynamic>),
        subTotal: (json['sub_total'] as num?)?.toDouble(),
        total: (json['total'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'cart': cart?.toJson(),
        'sub_total': subTotal,
        'total': total,
      };
}
