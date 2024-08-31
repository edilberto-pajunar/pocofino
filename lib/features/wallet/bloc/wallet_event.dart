part of 'wallet_bloc.dart';

class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];
}

final class WalletTopUpRequested extends WalletEvent {
  final double? amount;

  const WalletTopUpRequested(this.amount);
}
