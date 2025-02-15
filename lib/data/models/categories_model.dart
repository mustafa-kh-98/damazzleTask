class CategoriesModel {
  final int id;
  final String name;
  final String slug;
  final String image;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image": image,
  };
}
