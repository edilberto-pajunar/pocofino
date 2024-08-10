import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/auth/bloc/auth_bloc.dart';
import 'package:pocofino/features/auth/view/sign_up_view.dart';

class SignUpPage extends StatelessWidget {
  static String route = "sign_up_page_route";
  const SignUpPage({
    required this.authBloc,
    super.key,
  });

  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authBloc,
      child: const SignUpView(),
    );
  }
}
