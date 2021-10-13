import 'package:shopify/utility/key_util.dart';
import 'package:shopify/utility/path.dart';

class PathUtil {
  static Path root() {
    return Path.fromPath("");
  }

  static Path productsPath() {
    return root().child(KeyUtil.products);
  }

  static Path productsPathById(int id) {
    return productsPath().child(id.toString());
  }

  static Path productsCountPath() {
    return productsPath().child(KeyUtil.count);
  }

  static Path customCollectionsPath() {
    return root().child(KeyUtil.customCollections);
  }

  static Path collectsPath() {
    return root().child(KeyUtil.collects);
  }

  static Path collectionsPathById(int id) {
    return root().child(KeyUtil.collections).child(id.toString());
  }

  static Path collectionsProductsPathById(int id) {
    return root()
        .child(KeyUtil.collections)
        .child(id.toString())
        .child(KeyUtil.products);
  }
}
