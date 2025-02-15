class CustomerModel {
  final int id;
  final String email;
  final String phone;
  final String name;
  final int type;
  final String? image;

  CustomerModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
    required this.type,
    required this.image,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        name: json["name"],
        type: json["type"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
        "name": name,
        "type": type,
        "image": image,
      };
}
