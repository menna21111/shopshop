class Datumsearch {
  int? id;
  int? price;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Datumsearch({
    this.id,
    this.price,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });

  factory Datumsearch.fromJson(Map<String, dynamic> json) => Datumsearch(
        id: json['id'] is int
            ? json['id'] as int
            : (json['id'] as double?)?.toInt(),
        price: json['price'] is int
            ? json['price'] as int
            : (json['price'] as double?)?.toInt(),
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'image': image,
        'name': name,
        'description': description,
        'images': images,
        'in_favorites': inFavorites,
        'in_cart': inCart,
      };
}
