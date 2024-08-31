import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:payment_repository/payment_repository.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final PaymentRepository _paymentRepository;

  WalletBloc({
    required PaymentRepository paymentRepository,
  })  : _paymentRepository = paymentRepository,
        super(const WalletState()) {
    on<WalletInitRequested>(_onInitRequested);
    on<WalletTopUpRequested>(_onTopUpRequested);
    on<WalletPaymentStatusUpdated>(_onPaymentStatusUpdated);
    on<WalletPaymentAddBalanceRequested>(_onPaymentAddBalanceRequested);
  }

  void _onInitRequested(
    WalletInitRequested event,
    Emitter<WalletState> emit,
  ) async {
    try {
      emit(state.copyWith(status: WalletStatus.loading));
      final wallet = await _paymentRepository.getWallet();
      emit(state.copyWith(amount: wallet, status: WalletStatus.success));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: WalletStatus.failure));
    }
  }

  void _onTopUpRequested(
    WalletTopUpRequested event,
    Emitter<WalletState> emit,
  ) async {
    if (event.amount == null) return;
    try {
      emit(state.copyWith(paymentStatus: PaymentStatus.loading));
      final paymentUrl = await _paymentRepository.generateQR(event.amount!);
      emit(state.copyWith(
        paymentStatus: PaymentStatus.success,
        paymentUrl: paymentUrl,
      ));
    } catch (e) {
      emit(state.copyWith(status: WalletStatus.failure));
    }
  }

  void _onPaymentStatusUpdated(
    WalletPaymentStatusUpdated event,
    Emitter<WalletState> emit,
  ) {
    emit(state.copyWith(paymentStatus: event.paymentStatus));
  }

  void _onPaymentAddBalanceRequested(
    WalletPaymentAddBalanceRequested event,
    Emitter<WalletState> emit,
  ) async {
    try {
      await _paymentRepository.addBalance(event.amount);
    } catch (e) {
      print(e);
      emit(state.copyWith(status: WalletStatus.failure));
    }
  }
}
