class Category {
  late String categoryType;
  late int id;
  late int network;
  late String title;

  Category({
    required this.network,
    required this.title,
    required this.categoryType,
    required this.id,
  });

  Category.fromJson(Map<String, dynamic> json) {
    categoryType = json['categoryType'];
    network = json['network'];
    title = json['title'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryType'] = categoryType;
    data['network'] = network;
    data['title'] = title;
    data['id'] = id;
    return data;
  }
}
