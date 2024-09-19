import 'package:api_repository/api_repository.dart';
import 'package:location_repository/location_repository.dart';

class LocationRepository {
  Future<List<Store>> getAllStores() async {
    try {
      final req = RequestModel(
        endpoint: "/api/stores",
        type: RequestType.get,
        data: {},
      );

      final response = await ApiRepository().send(req);

      final stores = (response["data"] as List)
          .map((store) => Store.fromJson(store))
          .toList();
      return stores;
    } catch (e) {
      rethrow;
    }
  }
}
