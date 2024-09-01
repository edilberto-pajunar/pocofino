import 'package:api_repository/api_repository.dart';
import 'package:product_repository/product_repository.dart';

class ActivityRepository {
  Future<List<Order>> getActivities(String token, String status) async {
    try {
      final req = RequestModel(
        endpoint: ApiRepository.urlWithParams(
          "/api/orders",
          {
            "status": status,
          },
        ),
        type: RequestType.get,
        data: {},
      );

      final response = await ApiRepository().send(req);
      final orders = (response["data"] as List)
          .map((order) => Order.fromJson(order))
          .toList();

      return orders;
    } catch (e) {
      rethrow;
    }
  }
}
