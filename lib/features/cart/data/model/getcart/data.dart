import 'package:shopshop/features/cart/data/model/getcart/cart_item.dart';

class Dataa {
  List<CartItem>? cartItems;
  double? subTotal;
  double? total;

  Dataa({this.cartItems, this.subTotal, this.total});

  factory Dataa.fromJson(Map<String, dynamic> json) => Dataa(
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        subTotal: (json['sub_total'] as num?)?.toDouble(),
        total: (json['total'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'cart_items': cartItems?.map((e) => e.toJson()).toList(),
        'sub_total': subTotal,
        'total': total,
      };
}
