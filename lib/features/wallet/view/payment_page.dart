import 'package:activity_repository/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';
import 'package:pocofino/features/wallet/bloc/wallet_bloc.dart';
import 'package:pocofino/features/wallet/view/payment_view.dart';

class PaymentPage extends StatelessWidget {
  static String route = "payment_page_route";
  const PaymentPage({
    super.key,
    required this.amount,
    required this.walletBloc,
    required this.paymentType,
    required this.orderBloc,
    required this.cartBloc,
  });

  final WalletBloc walletBloc;
  final double amount;
  final PaymentType paymentType;
  final OrderBloc orderBloc;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: cartBloc,
        ),
        BlocProvider.value(
          value: walletBloc,
        ),
        BlocProvider.value(
          value: orderBloc,
        ),
      ],
      child: BlocListener<WalletBloc, WalletState>(
        listener: (context, state) {
          if (state.paymentStatus == PaymentStatus.failed) {
            Fluttertoast.showToast(msg: state.error);
          }
        },
        child: PaymentView(
          amount: amount,
          paymentType: paymentType,
        ),
      ),
    );
  }
}
