import 'package:api_repository/api_repository.dart';

class PaymentRepository {
  Future<double> getWallet() async {
    final req = RequestModel(
      endpoint: "/api/wallet",
      type: RequestType.get,
      data: {},
    );

    final response = await ApiRepository().send(req);
    return double.parse((response["data"]["balance"] as int).toString());
  }

  Future<String> generateQR(double amount) async {
    final req = RequestModel(
      endpoint: "/api/payment/generate_qr",
      type: RequestType.post,
      data: {
        "amount": amount.toString(),
      },
    );

    final response = await ApiRepository().send(req);
    return response["data"]["redirectUrl"];
  }

  Future<String> addBalance(double amount) async {
    final req = RequestModel(
      endpoint: "/api/wallet/add_balance",
      type: RequestType.post,
      data: {
        "amount": amount.toString(),
      },
    );

    final response = await ApiRepository().send(req);
    return response["status"];
  }
}
