import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pocofino/config/router/router.gr.dart';
import 'package:pocofino/config/strings/color.dart';
import 'package:pocofino/views/widgets/buttons/primary_button.dart';
import 'package:pocofino/views/widgets/fields/primary_text_field.dart';

@RoutePage()
class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Create an Account",
          style: theme.textTheme.titleLarge!.copyWith(
            color: ColorTheme.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const PrimaryTextField(
                  label: "First Name",
                ),
                const PrimaryTextField(
                  label: "Last Name",
                ),
                const PrimaryTextField(
                  label: "Email",
                ),
                const PrimaryTextField(
                  label: "Password",
                ),
                const PrimaryTextField(
                  label: "Confirm Password",
                ),
                PrimaryButton(
                  onPressed: () {},
                  label: "Sign Up",
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
                  label: "Sign Up with Mobile Number",
                  basic: true,
                ),
                const SizedBox(height: 30.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: theme.textTheme.bodyMedium,
                    children: [
                      TextSpan(
                          text: "Login",
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: ColorTheme.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () => context.pushRoute(const LoginRoute())),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
