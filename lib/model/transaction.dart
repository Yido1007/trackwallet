class AppTransaction {
  String id;
  int amount;
  String type;
  String description;
  DateTime date;
  String categoryId;
  String userId;
  Category category;

  AppTransaction({
    required this.id,
    required this.amount,
    required this.type,
    required this.description,
    required this.date,
    required this.categoryId,
    required this.userId,
    required this.category,
  });

  factory AppTransaction.fromJson(Map<String, dynamic> json) => AppTransaction(
    id: json["id"],
    amount: json["amount"],
    type: json["type"],
    description: json["description"],
    date: DateTime.parse(json["date"]),
    categoryId: json["category_id"],
    userId: json["user_id"],
    category: Category.fromJson(json["Category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "type": type,
    "description": description,
    "date":
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "category_id": categoryId,
    "user_id": userId,
    "Category": category.toJson(),
  };
}

class Category {
  String name;
  String icon;
  String type;

  Category({required this.name, required this.icon, required this.type});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(name: json["name"], icon: json["icon"], type: json["type"]);

  Map<String, dynamic> toJson() => {"name": name, "icon": icon, "type": type};
}
