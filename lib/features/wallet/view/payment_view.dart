import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/wallet/bloc/wallet_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentView extends StatefulWidget {
  final double amount;

  const PaymentView({
    super.key,
    required this.amount,
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
              context
                  .read<WalletBloc>()
                  .add(const WalletPaymentStatusUpdated(PaymentStatus.success));
            } else if (request.url.contains("cancel")) {
              context.read<WalletBloc>().add(
                  const WalletPaymentStatusUpdated(PaymentStatus.cancelled));
            } else if (request.url.contains("failed")) {
              context
                  .read<WalletBloc>()
                  .add(const WalletPaymentStatusUpdated(PaymentStatus.failed));
            }

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
        listener: (context, state) {
          if (state.paymentStatus == PaymentStatus.success) {
            context
              ..read<WalletBloc>()
                  .add(WalletPaymentAddBalanceRequested(widget.amount))
              ..pop()
              ..pop();
          }

          if (state.paymentStatus == PaymentStatus.cancelled) {
            context.pop();
          }
        },
        builder: (context, state) {
          if (state.paymentStatus == PaymentStatus.loading) {}

          if (state.paymentStatus == PaymentStatus.failed) {}
          if (state.paymentStatus == PaymentStatus.cancelled) {}
          return WebViewWidget(
            controller: controller,
          );
        },
      ),
    );
  }
}
