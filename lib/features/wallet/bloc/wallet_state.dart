part of 'wallet_bloc.dart';

enum WalletStatus { initial, loading, success, failure }

enum PaymentStatus { initial, loading, success, failed, cancelled }

class WalletState extends Equatable {
  final WalletStatus status;
  final String paymentUrl;
  final PaymentStatus paymentStatus;
  final double amount;

  const WalletState({
    this.status = WalletStatus.initial,
    this.paymentUrl = "",
    this.paymentStatus = PaymentStatus.initial,
    this.amount = 0.0,
  });
  WalletState copyWith({
    WalletStatus? status,
    PaymentStatus? paymentStatus,
    String? paymentUrl,
    double? amount,
  }) {
    return WalletState(
      status: status ?? this.status,
      paymentUrl: paymentUrl ?? this.paymentUrl,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object?> get props => [
        status,
        paymentUrl,
        paymentStatus,
        amount,
      ];
}
