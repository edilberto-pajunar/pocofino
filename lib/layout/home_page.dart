import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_repository/location_repository.dart';
import 'package:payment_repository/payment_repository.dart';
import 'package:pocofino/app/bloc/app_bloc.dart';
import 'package:pocofino/features/auth/view/login_page.dart';
import 'package:pocofino/features/cart/bloc/cart_bloc.dart';
import 'package:pocofino/features/menu/bloc/menu_bloc.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';
import 'package:pocofino/features/wallet/bloc/wallet_bloc.dart';
import 'package:pocofino/layout/bloc/timer_bloc.dart';
import 'package:pocofino/layout/home_view.dart';
import 'package:pocofino/layout/ticker.dart';
import 'package:product_repository/product_repository.dart';

class HomePage extends StatefulWidget {
  static String route = "home_page_route";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final token = context.watch<AppBloc>().state.token;

    if (token == null) {
      return const LoginPage();
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc(
            productRepository: context.read<ProductRepository>(),
          )..add(CartInitRequested()),
        ),
        BlocProvider(
          create: (context) => OrderBloc(
            productRepository: context.read<ProductRepository>(),
            locationRepository: context.read<LocationRepository>(),
            token: token,
          )..add(OrderInitRequested()),
        ),
        BlocProvider(
          create: (context) => MenuBloc(
            productRepository: context.read<ProductRepository>(),
            token: token,
          )..add(MenuInitRequested()),
        ),
        BlocProvider(
          create: (context) => WalletBloc(
            paymentRepository: context.read<PaymentRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => TimerBloc(
            ticker: const Ticker(),
          ),
        ),
      ],
      child: const HomeView(),
    );
  }
}
