import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/auth/bloc/auth_bloc.dart';
import 'package:pocofino/features/auth/view/login_view.dart';

class LoginPage extends StatelessWidget {
  static String route = "login_page_route";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        authRepository: context.read<AuthRepository>(),
      ),
      child: const LoginView(),
    );
  }
}
