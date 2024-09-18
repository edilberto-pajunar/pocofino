import 'package:activity_repository/activity_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:payment_repository/payment_repository.dart';
import 'package:product_repository/product_repository.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final PaymentRepository _paymentRepository;

  WalletBloc({
    required PaymentRepository paymentRepository,
  })  : _paymentRepository = paymentRepository,
        super(const WalletState()) {
    on<WalletInitRequested>(_onInitRequested);
    on<WalletInitTransactionRequested>(_onInitTransactionRequested);
    on<WalletInitBalanceRequested>(_onInitBalanceRequested);
    on<WalletPaymentGenerated>(_onPaymentGenerated);
    on<WalletPaymentAddBalanceRequested>(_onPaymentAddBalanceRequested);
    on<WalletOrderPaymentRequested>(_onOrderPaymentRequested);
    on<WalletFailed>(_onWalletFailed);
  }

  void _onInitRequested(
    WalletInitRequested event,
    Emitter<WalletState> emit,
  ) async {
    add(WalletInitTransactionRequested());
    add(WalletInitBalanceRequested());
  }

  void _onInitBalanceRequested(
    WalletInitBalanceRequested event,
    Emitter<WalletState> emit,
  ) async {
    try {
      emit(state.copyWith(status: WalletStatus.loading));
      final wallet = await _paymentRepository.getWallet();
      emit(state.copyWith(amount: wallet, status: WalletStatus.success));
    } catch (e) {
      emit(state.copyWith(status: WalletStatus.failure));
    }
  }

  void _onInitTransactionRequested(
    WalletInitTransactionRequested event,
    Emitter<WalletState> emit,
  ) async {
    try {
      emit(state.copyWith(status: WalletStatus.loading));
      final transactions = await _paymentRepository.getTransactions();
      emit(state.copyWith(
          transactions: transactions, status: WalletStatus.success));
    } catch (e) {
      emit(state.copyWith(status: WalletStatus.failure));
    }
  }

  void _onPaymentGenerated(
    WalletPaymentGenerated event,
    Emitter<WalletState> emit,
  ) async {
    if (event.amount == null) return;
    try {
      emit(state.copyWith(status: WalletStatus.loading));
      final paymentUrl = await _paymentRepository.generateQR(event.amount!);
      emit(state.copyWith(
        paymentStatus: PaymentStatus.generated,
        paymentUrl: paymentUrl,
      ));
    } catch (e) {
      emit(state.copyWith(status: WalletStatus.failure));
    }
  }

  void _onPaymentAddBalanceRequested(
    WalletPaymentAddBalanceRequested event,
    Emitter<WalletState> emit,
  ) async {
    try {
      emit(state.copyWith(paymentStatus: PaymentStatus.loading));
      await _paymentRepository.topUp(event.amount.toString());
      emit(state.copyWith(
        paymentStatus: PaymentStatus.success,
      ));
    } catch (e) {
      print("Error: $e");
      emit(state.copyWith(status: WalletStatus.failure));
    }
  }

  void _onOrderPaymentRequested(
    WalletOrderPaymentRequested event,
    Emitter<WalletState> emit,
  ) async {
    try {
      emit(state.copyWith(paymentStatus: PaymentStatus.loading));
      await _paymentRepository.payment(
        event.total.toString(),
        event.products,
      );
      emit(state.copyWith(
        paymentStatus: PaymentStatus.success,
      ));
    } catch (e) {
      add(WalletFailed(e.toString()));
    }
  }

  void _onWalletFailed(
    WalletFailed event,
    Emitter<WalletState> emit,
  ) {
    emit(state.copyWith(
      paymentStatus: PaymentStatus.failed,
      error: event.error,
    ));
  }
}
