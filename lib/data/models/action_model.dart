class ActionModel {
  final String title;
  final String link;

  ActionModel({
    required this.title,
    required this.link,
  });

  factory ActionModel.fromJson(Map<String, dynamic> json) => ActionModel(
    title: json["title"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "link": link,
  };
}
