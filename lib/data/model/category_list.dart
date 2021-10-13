
import 'package:shopify/data/model/category.dart';

class CategoryList {
  late String message;
  late bool success;
  late List<Category>? data;

  CategoryList({
    required this.data,
    required this.message,
    required this.success,
  });

  CategoryList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json["data"] != null) {
      data = <Category>[];
      json['data'].forEach((v) {
        data!.add(new Category.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success '] = this.success;
    return data;
  }
}
