import 'package:shopify/data/model/product_list.dart';

class Cart {
  Cart({
    this.id,
    this.title,
    this.variants,
    this.images,
    this.image,
    this.count = 1,
  });

  Cart.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    if (json['variants'] != null) {
      variants = Variants.fromJson(json['variants']);
    }
    if (json['images'] != null) {
      images = Images.fromJson(json['images']);
    }
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    count = 1;
  }

  int? id;
  String? title;
  Variants? variants;
  Images? images;
  Image? image;
  int? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    if (variants != null) {
      map['variants'] = variants!.toJson();
    }
    if (images != null) {
      map['images'] = images!.toJson();
    }
    if (image != null) {
      map['image'] = image?.toJson();
    }
    return map;
  }

  Cart copyWith({
    int? id,
    String? title,
    Variants? variants,
    Images? images,
    Image? image,
  }) {
    return Cart(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      images: images ?? this.images,
      variants: variants ?? this.variants,
    );
  }
}
