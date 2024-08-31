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
    on<WalletTopUpRequested>(_onTopUpRequested);
  }

  void _onTopUpRequested(
    WalletTopUpRequested event,
    Emitter<WalletState> emit,
  ) async {
    if (event.amount == null) return;
    try {
      emit(state.copyWith(status: WalletStatus.loading));
      final paymentUrl = await _paymentRepository.generateQR(event.amount!);
      emit(state.copyWith(
        status: WalletStatus.success,
        paymentUrl: paymentUrl,
      ));
    } catch (e) {}
  }
}
