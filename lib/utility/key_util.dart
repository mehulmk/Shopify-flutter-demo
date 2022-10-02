class KeyUtil {
  static String token = "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";
  static String baseUrl = "https://nividata-test-store.myshopify.com/admin/api/2021-07/";

  static const List<int> homeBanner = [
    281661669575, //Footwear
    282129694919, //Big Sale
    282130448583, //Navratri Sale
  ];

  static const List<int> homeCategory = [
    281873383623, //Accessories
    281873481927, //Bag
    281873416391, //Cloth
    281873547463, //Footwear
    281873612999, //Jewelry
  ];

  static const List<int> categoryList = [
    281873383623, //Accessories
    281873481927, //Bag
    281873416391, //Cloth
    281873547463, //Footwear
    281873612999, //Jewelry
    282130645191, //Bikinis
    282130874567, //Dresses
    282130940103, //Hoodies
    282131005639, //Skirts
    282131038407, //T-shirts
  ];

  static const List<List<int>> searchCategoryList = [
    [
      281873383623, //Accessories
      281873481927, //Bag
      281873416391, //Cloth
      281873547463, //Footwear
      282131038407, //T-shirts
    ],
    [
      281873612999, //Jewelry
      282130645191, //Bikinis
      282130874567, //Dresses
      282130940103, //Hoodies
      282131005639, //Skirts
    ]
  ];

  static const int flashSell = 281877217479;
  static const int megaSell = 281877283015;
  static const int recommendedProduct = 281878921415;

  static const List<int> offerList = [
    281661669575, //Footwear
    282129694919, //Big Sale
    282130448583, //Navratri Sale
    flashSell,
    megaSell,
  ];

  static const products = "products";
  static const count = "count";
  static const customCollections = "custom_collections";
  static const collects = "collects";
  static const collections = "collections";
}
