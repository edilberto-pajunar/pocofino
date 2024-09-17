import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';
import 'package:pocofino/features/wallet/bloc/wallet_bloc.dart';
import 'package:pocofino/features/wallet/view/top_up_view.dart';

class TopUpPage extends StatelessWidget {
  static String route = "top_up_page_route";
  const TopUpPage({
    required this.cartBloc,
    required this.walletBloc,
    required this.orderBloc,
    super.key,
  });

  final CartBloc cartBloc;
  final WalletBloc walletBloc;
  final OrderBloc orderBloc;

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
      child: const TopUpView(),
    );
  }
}
