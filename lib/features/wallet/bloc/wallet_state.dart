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
    double? amount,
=======
>>>>>>> a12190c66b6da93d985436c6910d1071ff93728e
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
