class Product {
  int? id;
  double? price;
  double? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] != null
            ? (json['id'] as num).toInt()
            : null, // Cast to int
        price: json['price'] != null
            ? (json['price'] as num).toDouble()
            : null, // Cast to double
        oldPrice: json['old_price'] != null
            ? (json['old_price'] as num).toDouble()
            : null, // Cast to double
        discount: json['discount'] != null
            ? (json['discount'] as num).toInt()
            : null, // Cast to int
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
        'name': name,
        'description': description,
      };
}
