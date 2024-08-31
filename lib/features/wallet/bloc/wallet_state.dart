part of 'wallet_bloc.dart';

enum WalletStatus { initial, loading, success, failure }

class WalletState extends Equatable {
  final WalletStatus status;
  final String paymentUrl;

  const WalletState({
    this.status = WalletStatus.initial,
    this.paymentUrl = "",
  });

  WalletState copyWith({
    WalletStatus? status,
    String? paymentUrl,
  }) {
    return WalletState(
      status: status ?? this.status,
      paymentUrl: paymentUrl ?? this.paymentUrl,
    );
  }

  @override
  List<Object?> get props => [
        status,
        paymentUrl,
      ];
}
