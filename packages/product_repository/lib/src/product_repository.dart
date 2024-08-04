import 'package:database_api/database_api.dart';
import 'package:product_repository/product_repository.dart';

class ProductRepository {
  ProductRepository({
    required DatabaseApi databaseApi,
  }) : _databaseApi = databaseApi;

  final DatabaseApi _databaseApi;

  static String productPath = "products";

  Stream<List<Product>> productStream() {
    return _databaseApi.collectionStream(
      path: productPath,
      builder: (data, _) => Product.fromJson(data),
    );
  }

  Future<void> setProducts(List<Product> products) async {
    await _databaseApi.setBatchDataForDocInList(
      baseColPath: productPath,
      docIdList: products.map((product) => product.id).toList(),
      dataFromId: (id) =>
          products.firstWhere((product) => product.id == id).toJson(),
    );
  }
}
