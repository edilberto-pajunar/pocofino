import 'package:auth_repository/auth_repository.dart';
import 'package:database_api/database_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/app/app_router.dart';
import 'package:pocofino/app/view/app_view.dart';
import 'package:product_repository/product_repository.dart';

class App extends StatefulWidget {
  const App({
    required this.authRepository,
    required this.databaseApi,
    required this.productRepository,
    super.key,
  });

  final AuthRepository authRepository;
  final DatabaseApi databaseApi;
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
        RepositoryProvider.value(value: widget.authRepository),
        RepositoryProvider.value(value: widget.databaseApi),
        RepositoryProvider.value(value: widget.productRepository),
      ],
      child: AppView(_appRouter),
    );
  }
}
