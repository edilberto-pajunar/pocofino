import 'package:activity_repository/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/activity/bloc/activity_bloc.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';
import 'package:pocofino/features/wallet/bloc/wallet_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentView extends StatefulWidget {
  final double amount;
  final PaymentType paymentType;

  const PaymentView({
    super.key,
    required this.amount,
    required this.paymentType,
  });

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) => LinearProgressIndicator(
            value: progress / 100,
          ),
          onPageStarted: (url) {},
          onPageFinished: (url) {},
          onNavigationRequest: (request) {
            print("Navigation URL: ${request.url}");
            if (request.url.contains("success")) {
              if (widget.paymentType == PaymentType.topUp) {
                context
                  ..read<WalletBloc>()
                      .add(WalletPaymentAddBalanceRequested(widget.amount))
                  ..read<WalletBloc>().add(WalletInitRequested())
                  ..pop()
                  ..pop();
              }

              if (widget.paymentType == PaymentType.payment) {
                context
                  ..read<WalletBloc>().add(WalletOrderPaymentRequested(
                    widget.amount,
                    context.read<CartBloc>().state.products,
                  ))
                  ..read<WalletBloc>().add(WalletInitRequested())
                  ..read<CartBloc>().add(CartInitRequested())
                  ..pop();
              }
            } else if (request.url.contains("cancel")) {
            } else if (request.url.contains("failed")) {}

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(context.read<WalletBloc>().state.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<WalletBloc, WalletState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<WalletBloc, WalletState>(
            builder: (context, state) {
              if (state.paymentStatus == PaymentStatus.loading) {}

              if (state.paymentStatus == PaymentStatus.failed) {}
              if (state.paymentStatus == PaymentStatus.cancelled) {}
              return WebViewWidget(
                controller: controller,
              );
            },
          );
        },
      ),
    );
  }
}
