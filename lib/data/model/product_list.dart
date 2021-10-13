class ProductList {
  ProductList({
    this.products,
  });

  ProductList.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }

  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Products {
  Products({
    this.id,
    this.title,
    this.bodyHtml,
    this.vendor,
    this.productType,
    this.createdAt,
    this.handle,
    this.updatedAt,
    this.publishedAt,
    this.templateSuffix,
    this.status,
    this.publishedScope,
    this.tags,
    this.adminGraphqlApiId,
    this.variants,
    this.options,
    this.images,
    this.image,
  });

  Products.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    bodyHtml = json['body_html'];
    vendor = json['vendor'];
    productType = json['product_type'];
    createdAt = json['created_at'];
    handle = json['handle'];
    updatedAt = json['updated_at'];
    publishedAt = json['published_at'];
    templateSuffix = json['template_suffix'];
    status = json['status'];
    publishedScope = json['published_scope'];
    tags = json['tags'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    if (json['variants'] != null) {
      variants = [];
      json['variants'].forEach((v) {
        variants?.add(Variants.fromJson(v));
      });
    }
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options?.add(Options.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  int? id;
  String? title;
  String? bodyHtml;
  String? vendor;
  String? productType;
  String? createdAt;
  String? handle;
  String? updatedAt;
  String? publishedAt;
  dynamic templateSuffix;
  String? status;
  String? publishedScope;
  String? tags;
  String? adminGraphqlApiId;
  List<Variants>? variants;
  List<Options>? options;
  List<Images>? images;
  Image? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['body_html'] = bodyHtml;
    map['vendor'] = vendor;
    map['product_type'] = productType;
    map['created_at'] = createdAt;
    map['handle'] = handle;
    map['updated_at'] = updatedAt;
    map['published_at'] = publishedAt;
    map['template_suffix'] = templateSuffix;
    map['status'] = status;
    map['published_scope'] = publishedScope;
    map['tags'] = tags;
    map['admin_graphql_api_id'] = adminGraphqlApiId;
    if (variants != null) {
      map['variants'] = variants?.map((v) => v.toJson()).toList();
    }
    if (options != null) {
      map['options'] = options?.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    if (image != null) {
      map['image'] = image?.toJson();
    }
    return map;
  }
}

class Image {
  Image({
    this.id,
    this.productId,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.alt,
    this.width,
    this.height,
    this.src,
    this.variantIds,
    this.adminGraphqlApiId,
  });

  Image.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    alt = json['alt'];
    width = json['width'];
    height = json['height'];
    src = json['src'];
    // if (json['variant_ids'] != null) {
    //   variantIds = [];
    //   json['variant_ids'].forEach((v) {
    //     variantIds?.add(dynamic.fromJson(v));
    //   });
    // }
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  int? id;
  int? productId;
  int? position;
  String? createdAt;
  String? updatedAt;
  dynamic alt;
  int? width;
  int? height;
  String? src;
  List<dynamic>? variantIds;
  String? adminGraphqlApiId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['position'] = position;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['alt'] = alt;
    map['width'] = width;
    map['height'] = height;
    map['src'] = src;
    if (variantIds != null) {
      map['variant_ids'] = variantIds?.map((v) => v.toJson()).toList();
    }
    map['admin_graphql_api_id'] = adminGraphqlApiId;
    return map;
  }
}

class Images {
  Images({
    this.id,
    this.productId,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.alt,
    this.width,
    this.height,
    this.src,
    this.variantIds,
    this.adminGraphqlApiId,
  });

  Images.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    alt = json['alt'];
    width = json['width'];
    height = json['height'];
    src = json['src'];
    // if (json['variant_ids'] != null) {
    //   variantIds = [];
    //   json['variant_ids'].forEach((v) {
    //     variantIds?.add(dynamic.fromJson(v));
    //   });
    // }
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  int? id;
  int? productId;
  int? position;
  String? createdAt;
  String? updatedAt;
  dynamic alt;
  int? width;
  int? height;
  String? src;
  List<dynamic>? variantIds;
  String? adminGraphqlApiId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['position'] = position;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['alt'] = alt;
    map['width'] = width;
    map['height'] = height;
    map['src'] = src;
    if (variantIds != null) {
      map['variant_ids'] = variantIds?.map((v) => v.toJson()).toList();
    }
    map['admin_graphql_api_id'] = adminGraphqlApiId;
    return map;
  }
}

class Options {
  Options({
    this.id,
    this.productId,
    this.name,
    this.position,
    this.values,
  });

  Options.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    position = json['position'];
    values = json['values'] != null ? json['values'].cast<String>() : [];
  }

  int? id;
  int? productId;
  String? name;
  int? position;
  List<String>? values;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['name'] = name;
    map['position'] = position;
    map['values'] = values;
    return map;
  }
}

class Variants {
  Variants({
    this.id,
    this.productId,
    this.title,
    this.price,
    this.sku,
    this.position,
    this.inventoryPolicy,
    this.compareAtPrice,
    this.fulfillmentService,
    this.inventoryManagement,
    this.option1,
    this.option2,
    this.option3,
    this.createdAt,
    this.updatedAt,
    this.taxable,
    this.barcode,
    this.grams,
    this.imageId,
    this.weight,
    this.weightUnit,
    this.inventoryItemId,
    this.inventoryQuantity,
    this.oldInventoryQuantity,
    this.requiresShipping,
    this.adminGraphqlApiId,
  });

  Variants.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    title = json['title'];
    price = json['price'];
    sku = json['sku'];
    position = json['position'];
    inventoryPolicy = json['inventory_policy'];
    compareAtPrice = json['compare_at_price'];
    fulfillmentService = json['fulfillment_service'];
    inventoryManagement = json['inventory_management'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxable = json['taxable'];
    barcode = json['barcode'];
    grams = json['grams'];
    imageId = json['image_id'];
    weight = json['weight'];
    weightUnit = json['weight_unit'];
    inventoryItemId = json['inventory_item_id'];
    inventoryQuantity = json['inventory_quantity'];
    oldInventoryQuantity = json['old_inventory_quantity'];
    requiresShipping = json['requires_shipping'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  int? id;
  int? productId;
  String? title;
  String? price;
  String? sku;
  int? position;
  String? inventoryPolicy;
  dynamic compareAtPrice;
  String? fulfillmentService;
  String? inventoryManagement;
  String? option1;
  dynamic option2;
  dynamic option3;
  String? createdAt;
  String? updatedAt;
  bool? taxable;
  dynamic barcode;
  int? grams;
  dynamic imageId;
  double? weight;
  String? weightUnit;
  int? inventoryItemId;
  int? inventoryQuantity;
  int? oldInventoryQuantity;
  bool? requiresShipping;
  String? adminGraphqlApiId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['title'] = title;
    map['price'] = price;
    map['sku'] = sku;
    map['position'] = position;
    map['inventory_policy'] = inventoryPolicy;
    map['compare_at_price'] = compareAtPrice;
    map['fulfillment_service'] = fulfillmentService;
    map['inventory_management'] = inventoryManagement;
    map['option1'] = option1;
    map['option2'] = option2;
    map['option3'] = option3;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['taxable'] = taxable;
    map['barcode'] = barcode;
    map['grams'] = grams;
    map['image_id'] = imageId;
    map['weight'] = weight;
    map['weight_unit'] = weightUnit;
    map['inventory_item_id'] = inventoryItemId;
    map['inventory_quantity'] = inventoryQuantity;
    map['old_inventory_quantity'] = oldInventoryQuantity;
    map['requires_shipping'] = requiresShipping;
    map['admin_graphql_api_id'] = adminGraphqlApiId;
    return map;
  }
}
