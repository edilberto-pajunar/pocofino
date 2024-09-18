part of 'wallet_bloc.dart';

enum WalletStatus { initial, loading, success, failure }

enum PaymentStatus { initial, loading, success, failed, generated, cancelled }

class WalletState extends Equatable {
  final WalletStatus status;
  final String paymentUrl;
  final PaymentStatus paymentStatus;
  final double amount;
  final List<Transaction> transactions;
  final String error;

  const WalletState({
    this.status = WalletStatus.initial,
    this.paymentUrl = "",
    this.paymentStatus = PaymentStatus.initial,
    this.amount = 0.0,
    this.transactions = const [],
    this.error = "",
  });
  WalletState copyWith({
    WalletStatus? status,
    PaymentStatus? paymentStatus,
    String? paymentUrl,
    double? amount,
    List<Transaction>? transactions,
    String? error,
  }) {
    return WalletState(
      status: status ?? this.status,
      paymentUrl: paymentUrl ?? this.paymentUrl,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      amount: amount ?? this.amount,
      transactions: transactions ?? this.transactions,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        paymentUrl,
        paymentStatus,
        amount,
        transactions,
        error,
      ];
}
