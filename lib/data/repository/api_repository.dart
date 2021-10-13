import 'package:dio/dio.dart';
import 'package:shopify/data/model/category_list.dart';
import 'package:shopify/data/model/custom_collection_list.dart';
import 'package:shopify/data/model/product_list.dart';
import 'package:shopify/data/model/collection_list.dart';
import 'package:shopify/data/network/api_client.dart';
import 'package:shopify/data/sharedpref/shared_preference_helper.dart';
import 'package:shopify/extension/rx_lift_error.dart';
import 'package:shopify/utility/path_util.dart';

class ApiRepository {
  final ApiService apiService;
  final SharedPreferencesHelper preferencesHelper;

  ApiRepository({required this.apiService, required this.preferencesHelper});

  Future<List<Products>> getProducts() {
    return apiService
        .get(path: PathUtil.productsPath())
        .asStream()
        .liftError()
        .map((Response response) {
      return ProductList.fromJson(response.data).products ?? [];
    }).first;
  }

  Future<List<Products>> getProductsByCollectionId(int id) {
    return apiService
        .get(path: PathUtil.productsPath(), params: {"collection_id": id})
        .asStream()
        .liftError()
        .map((Response response) {
          return ProductList.fromJson(response.data).products ?? [];
        })
        .first;
  }

  Future<List<Products>> getProductsByProductType(String productType) {
    return apiService
        .get(
          path: PathUtil.productsPath(),
          params: {"product_type": productType, "limit": 4},
        )
        .asStream()
        .liftError()
        .map((Response response) {
          return ProductList.fromJson(response.data).products ?? [];
        })
        .first;
  }

  Future<Products> getProductsById(int id) {
    return apiService
        .get(path: PathUtil.productsPathById(id))
        .asStream()
        .liftError()
        .map((Response response) {
      return Products.fromJson(response.data['product']);
    }).first;
  }

  Future<CategoryList> getProductsCount() {
    return apiService
        .get(path: PathUtil.productsCountPath())
        .asStream()
        .liftError()
        .map((Response response) {
      return CategoryList.fromJson(response.data);
    }).first;
  }

  Future<List<CustomCollections>> getCustomCollections() {
    return apiService
        .get(path: PathUtil.customCollectionsPath())
        .asStream()
        .liftError()
        .map((Response response) {
      return CustomCollectionList.fromJson(response.data).customCollections ??
          [];
    }).first;
  }

  Future<Collection?> getCollectionsById(int id) {
    return apiService
        .get(path: PathUtil.collectionsPathById(id))
        .asStream()
        .liftError()
        .map((Response response) {
      return CollectionList.fromJson(response.data).collection;
    }).first;
  }

  Future<List<Products>> getCollectionsProductsById(int id) {
    return apiService
        .get(path: PathUtil.collectionsProductsPathById(id))
        .asStream()
        .liftError()
        .map((Response response) {
      return ProductList.fromJson(response.data).products ?? [];
    }).first;
  }
}
