class CollectionList {
  CollectionList({
    this.collection,
  });

  CollectionList.fromJson(dynamic json) {
    collection = json['collection'] != null
        ? Collection.fromJson(json['collection'])
        : null;
  }

  Collection? collection;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (collection != null) {
      map['collection'] = collection?.toJson();
    }
    return map;
  }
}

class Collection {
  Collection({
    this.id,
    this.handle,
    this.title,
    this.updatedAt,
    this.bodyHtml,
    this.publishedAt,
    this.sortOrder,
    this.templateSuffix,
    this.productsCount,
    this.collectionType,
    this.publishedScope,
    this.adminGraphqlApiId,
    this.image,
  });

  Collection.fromJson(dynamic json) {
    id = json['id'];
    handle = json['handle'];
    title = json['title'];
    updatedAt = json['updated_at'];
    bodyHtml = json['body_html'];
    publishedAt = json['published_at'];
    sortOrder = json['sort_order'];
    templateSuffix = json['template_suffix'];
    productsCount = json['products_count'];
    collectionType = json['collection_type'];
    publishedScope = json['published_scope'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  int? id;
  String? handle;
  String? title;
  String? updatedAt;
  String? bodyHtml;
  String? publishedAt;
  String? sortOrder;
  String? templateSuffix;
  int? productsCount;
  String? collectionType;
  String? publishedScope;
  String? adminGraphqlApiId;
  Image? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['handle'] = handle;
    map['title'] = title;
    map['updated_at'] = updatedAt;
    map['body_html'] = bodyHtml;
    map['published_at'] = publishedAt;
    map['sort_order'] = sortOrder;
    map['template_suffix'] = templateSuffix;
    map['products_count'] = productsCount;
    map['collection_type'] = collectionType;
    map['published_scope'] = publishedScope;
    map['admin_graphql_api_id'] = adminGraphqlApiId;
    if (image != null) {
      map['image'] = image?.toJson();
    }
    return map;
  }
}

class Image {
  Image({
    this.createdAt,
    this.alt,
    this.width,
    this.height,
    this.src,
  });

  Image.fromJson(dynamic json) {
    createdAt = json['created_at'];
    alt = json['alt'];
    width = json['width'];
    height = json['height'];
    src = json['src'];
  }

  String? createdAt;
  dynamic alt;
  int? width;
  int? height;
  String? src;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['created_at'] = createdAt;
    map['alt'] = alt;
    map['width'] = width;
    map['height'] = height;
    map['src'] = src;
    return map;
  }
}
