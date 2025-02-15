import 'action_model.dart';

class BannersModel {
  final int id;
  final String title;
  final String description;
  final String media;
  final List<ActionModel> actions;
  final DateTime createdAt;

  BannersModel({
    required this.id,
    required this.title,
    required this.description,
    required this.media,
    required this.actions,
    required this.createdAt,
  });

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    media: json["media"],
    actions: List<ActionModel>.from(json["actions"].map((x) => ActionModel.fromJson(x))),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "media": media,
    "actions": List<dynamic>.from(actions.map((x) => x.toJson())),
    "created_at": createdAt.toIso8601String(),
  };
}