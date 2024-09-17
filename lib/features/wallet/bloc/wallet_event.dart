part of 'wallet_bloc.dart';

class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];
}

final class WalletInitRequested extends WalletEvent {}

final class WalletInitTransactionRequested extends WalletEvent {}

final class WalletInitBalanceRequested extends WalletEvent {}

final class WalletTopUpRequested extends WalletEvent {
  final double? amount;

  const WalletTopUpRequested(this.amount);
}

final class WalletPaymentStatusUpdated extends WalletEvent {
  final PaymentStatus paymentStatus;

  const WalletPaymentStatusUpdated(this.paymentStatus);
}

final class WalletPaymentAddBalanceRequested extends WalletEvent {
  final double amount;

  const WalletPaymentAddBalanceRequested(this.amount);
}

final class WalletOrderPaymentRequested extends WalletEvent {
  final List<Product> products;
  final double total;

  const WalletOrderPaymentRequested(this.total, this.products);
}

final class WalletFailed extends WalletEvent {
  final String error;

  const WalletFailed(this.error);
}
