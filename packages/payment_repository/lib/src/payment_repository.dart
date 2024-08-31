import 'package:api_repository/api_repository.dart';

class PaymentRepository {
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
}
