class NameModel {
  final String name;

  NameModel({
    required this.name,
  });

  factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
