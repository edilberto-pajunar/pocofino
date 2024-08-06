import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocofino/features/auth/bloc/auth_bloc.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: size.height * 0.1),
                Text(
                  "Log In your Account",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: ColorTheme.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40.0),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.status == LoginStatus.loginFailure) {
                      Fluttertoast.showToast(msg: "${state.error}");
                    }
                  },
                  child: PrimaryButton(
                    onPressed: () {
                      context
                          .read<AuthBloc>()
                          .add(const AuthGoogleSignInAttempted());
                    },
                    label: "Sign in with Google",
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Forgot Password?",
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.end,
                ),
                const SizedBox(height: 30.0),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(),
                    ),
                    SizedBox(width: 4.0),
                    Text("or"),
                    SizedBox(width: 4.0),
                    Expanded(
                      child: Divider(),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                PrimaryButton(
                  onPressed: () {},
                  label: "Log In with Mobile Number",
                  basic: true,
                ),
                const SizedBox(height: 30.0),
                // RichText(
                //   textAlign: TextAlign.center,
                //   text: TextSpan(
                //     text: "Don't have an account? ",
                //     style: theme.textTheme.bodyMedium,
                //     children: [
                //       TextSpan(
                //         text: "Sign Up",
                //         style: theme.textTheme.bodyMedium!.copyWith(
                //           color: ColorTheme.primaryColor,
                //         ),
                //         recognizer: TapGestureRecognizer()
                //           ..onTap = () => context.read<AuthBloc>().add(
                //               const AuthScreenTriggered(AuthStatus.signUp)),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
