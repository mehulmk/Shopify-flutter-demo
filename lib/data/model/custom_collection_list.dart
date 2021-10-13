class CustomCollectionList {
  CustomCollectionList({
    this.customCollections,
  });

  CustomCollectionList.fromJson(dynamic json) {
    if (json['custom_collections'] != null) {
      customCollections = [];
      json['custom_collections'].forEach((v) {
        customCollections?.add(CustomCollections.fromJson(v));
      });
    }
  }

  List<CustomCollections>? customCollections;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (customCollections != null) {
      map['custom_collections'] =
          customCollections?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CustomCollections {
  CustomCollections({
    this.id,
    this.handle,
    this.title,
    this.updatedAt,
    this.bodyHtml,
    this.publishedAt,
    this.sortOrder,
    this.templateSuffix,
    this.publishedScope,
    this.adminGraphqlApiId,
  });

  CustomCollections.fromJson(dynamic json) {
    id = json['id'];
    handle = json['handle'];
    title = json['title'];
    updatedAt = json['updated_at'];
    bodyHtml = json['body_html'];
    publishedAt = json['published_at'];
    sortOrder = json['sort_order'];
    templateSuffix = json['template_suffix'];
    publishedScope = json['published_scope'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  int? id;
  String? handle;
  String? title;
  String? updatedAt;
  String? bodyHtml;
  String? publishedAt;
  String? sortOrder;
  String? templateSuffix;
  String? publishedScope;
  String? adminGraphqlApiId;

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
    map['published_scope'] = publishedScope;
    map['admin_graphql_api_id'] = adminGraphqlApiId;
    return map;
  }
}
