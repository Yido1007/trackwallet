class AppCategory {
  String id;
  String name;
  String type;
  String icon;
  bool isSystem;
  dynamic userId;
  DateTime createdAt;
  DateTime updatedAt;

  AppCategory({
    required this.id,
    required this.name,
    required this.type,
    required this.icon,
    required this.isSystem,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AppCategory.fromJson(Map<String, dynamic> json) => AppCategory(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    icon: json["icon"],
    isSystem: json["is_system"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "icon": icon,
    "is_system": isSystem,
    "user_id": userId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
