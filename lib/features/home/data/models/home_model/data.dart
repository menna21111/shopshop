import 'banner.dart';
import 'product.dart';

class Dataa {
  List<Banner>? banners;
  List<Product>? products;
  String? ad;

  Dataa({this.banners, this.products, this.ad});

  factory Dataa.fromJson(Map<String, dynamic> json) => Dataa(
        banners: (json['banners'] as List<dynamic>?)
            ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
            .toList(),
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        ad: json['ad'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'banners': banners?.map((e) => e.toJson()).toList(),
        'products': products?.map((e) => e.toJson()).toList(),
        'ad': ad,
      };
}
