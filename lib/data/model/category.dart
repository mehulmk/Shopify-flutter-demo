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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryType'] = this.categoryType;
    data['network'] = this.network;
    data['title'] = this.title;
    data['id'] = this.id;
    return data;
  }
}
