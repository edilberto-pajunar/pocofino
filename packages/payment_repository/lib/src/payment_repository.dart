import 'package:activity_repository/activity_repository.dart';
import 'package:api_repository/api_repository.dart';
import 'package:product_repository/product_repository.dart';

class PaymentRepository {
  Future<double> getWallet() async {
    final req = RequestModel(
      endpoint: "/api/wallets",
      type: RequestType.get,
      data: {},
    );

    final response = await ApiRepository().send(req);
    return (response["data"]["balance"] as num).toDouble();
  }

  Future<String> generateQR(double amount) async {
    final req = RequestModel(
      endpoint: "/api/payments/generate_qr",
      type: RequestType.post,
      data: {
        "amount": amount.toString(),
      },
    );

    final response = await ApiRepository().send(req);
    return response["data"]["redirectUrl"];
  }

  Future<String> topUp(String amount) async {
    final req = RequestModel(
      endpoint: "/api/wallets/top_up",
      type: RequestType.post,
      data: {
        "amount": amount,
      },
    );

    final response = await ApiRepository().send(req);
    return response["status"];
  }

  Future<List<Transaction>> getTransactions() async {
    final req = RequestModel(
      endpoint: "/api/users/transactions",
      type: RequestType.get,
      data: {},
    );

    final response = await ApiRepository().send(req);
    final transactions = (response["data"] as List);
    return transactions
        .map((transaction) => Transaction.fromJson(transaction))
        .toList();
  }

  Future<String> payment(String amount, List<Product> products) async {
    final req = RequestModel(
      endpoint: "/api/wallets/payment",
      type: RequestType.post,
      data: {
        "amount": amount,
      },
    );

    final response = await ApiRepository().send(req);
    return response["status"];
  }
}
