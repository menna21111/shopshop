class Data {
  String? name;
  String? phone;
  String? email;
  int? id;
  String? image;
  String? token;

  Data({
    this.name,
    this.phone,
    this.email,
    this.id,
    this.image,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    // Debugging each field type
    print("Parsing Data: $json");
    
    return Data(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      // Debug id type
      id: json['id'] is String ? int.tryParse(json['id']) : json['id'] as int?, 
      image: json['image'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        'id': id,
        'image': image,
        'token': token,
      };
}
