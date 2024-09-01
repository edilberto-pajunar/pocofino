import 'package:activity_repository/activity_repository.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:database_api/database_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_repository/location_repository.dart';
import 'package:payment_repository/payment_repository.dart';
import 'package:pocofino/app/app_router.dart';
import 'package:pocofino/app/view/app_view.dart';
import 'package:pocofino/app/bloc/app_bloc.dart';
import 'package:product_repository/product_repository.dart';

class App extends StatefulWidget {
  const App({
    required this.activityRepository,
    required this.authRepository,
    required this.databaseApi,
    required this.locationRepository,
    required this.paymentRepository,
    required this.productRepository,
    super.key,
  });

  final ActivityRepository activityRepository;
  final AuthRepository authRepository;
  final DatabaseApi databaseApi;
  final LocationRepository locationRepository;
  final PaymentRepository paymentRepository;
  final ProductRepository productRepository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter = AppRouter(
    authRepository: widget.authRepository,
  );

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: widget.activityRepository),
        RepositoryProvider.value(value: widget.authRepository),
        RepositoryProvider.value(value: widget.databaseApi),
        RepositoryProvider.value(value: widget.locationRepository),
        RepositoryProvider.value(value: widget.paymentRepository),
        RepositoryProvider.value(value: widget.productRepository),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          authRepository: widget.authRepository,
        )..add(AppInitRequested()),
        child: AppView(_appRouter),
      ),
    );
  }
}
