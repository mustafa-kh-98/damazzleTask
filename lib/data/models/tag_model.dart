class TagModel {
  final int id;
  final String title;

  TagModel({
    required this.id,
    required this.title,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) => TagModel(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
