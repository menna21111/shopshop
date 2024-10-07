class Datum {
  int? id;
  String? image;
  dynamic category;
  dynamic product;

  Datum({this.id, this.image, this.category, this.product});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        image: json['image'] as String?,
        category: json['category'] as dynamic,
        product: json['product'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'category': category,
        'product': product,
      };
}
