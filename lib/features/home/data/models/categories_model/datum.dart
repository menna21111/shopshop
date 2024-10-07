class Datuum {
  int? id;
  String? name;
  String? image;

  Datuum({this.id, this.name, this.image});

  factory Datuum.fromJson(Map<String, dynamic> json) => Datuum(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
