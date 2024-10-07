class Product {
  int? id;
  double? price;
  double? oldPrice;
  int? discount;
  String? image;

  Product({this.id, this.price, this.oldPrice, this.discount, this.image});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] != null
            ? (json['id'] as num).toInt()
            : null, // Explicitly cast to int
        price: json['price'] != null
            ? (json['price'] as num).toDouble()
            : null, // Explicitly cast to double
        oldPrice: json['old_price'] != null
            ? (json['old_price'] as num).toDouble()
            : null, // Explicitly cast to double
        discount: json['discount'] != null
            ? (json['discount'] as num).toInt()
            : null, // Explicitly cast to int
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
      };
}
