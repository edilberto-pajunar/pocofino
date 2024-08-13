import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/app/view/bloc/app_bloc.dart';
import 'package:pocofino/features/auth/bloc/auth_bloc.dart';
import 'package:pocofino/features/auth/view/login_page.dart';
import 'package:pocofino/features/auth/view/sign_up_page.dart';
import 'package:pocofino/features/menu/view/menu_page.dart';
import 'package:pocofino/layout/home_page.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';
import 'package:pocofino/widgets/fields/primary_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraint.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.1),
                      Text(
                        "Log In your Account",
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: ColorTheme.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12.0),
                      FormBuilder(
                        key: _formKey,
                        onChanged: () => _formKey.currentState!.save(),
                        skipDisabled: true,
                        child: Column(
                          children: [
                            PrimaryTextField(
                              label: "Email",
                              name: "email",
                              hintText: "email@gmail.com",
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.email(),
                              ]),
                            ),
                            PrimaryTextField(
                              label: "Password",
                              name: "password",
                              hintText: "123456",
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              isPassword: true,
                            ),
                          ],
                        ),
                      ),
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state.status == AuthStatus.success) {
                            context.read<AppBloc>().add(AppInitRequested());
                          }
                        },
                        builder: (context, state) {
                          return state.status == AuthStatus.loading
                              ? const CircularProgressIndicator()
                              : PrimaryButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      final formValue =
                                          _formKey.currentState?.value;

                                      context
                                          .read<AuthBloc>()
                                          .add(AuthSignInRequested(
                                            email: formValue?["email"],
                                            password: formValue?["password"],
                                          ));
                                    }
                                  },
                                  label: "Sign In",
                                );
                        },
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
                      BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state.status == AuthStatus.failure) {
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
                      PrimaryButton(
                        onPressed: () {},
                        label: "Log In with Mobile Number",
                        basic: true,
                      ),
                      const SizedBox(height: 30.0),
                      Visibility(
                        visible: kIsWeb,
                        child: FormBuilder(
                          onChanged: () => _formKey.currentState!.save(),
                          key: _formKey,
                          child: Column(
                            children: [
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
                              const SizedBox(height: 12.0),
                              const PrimaryTextField(
                                name: "admin",
                                label: "Admin",
                                hintText: "Admin",
                              ),
                              const PrimaryTextField(
                                name: "password",
                                label: "Password",
                                hintText: "Password",
                                isPassword: true,
                              ),
                              PrimaryButton(
                                onPressed: () {
                                  final form = _formKey.currentState!.value;
                                  context
                                      .read<AuthBloc>()
                                      .add(AuthAdminSignInAttempted(
                                        form["admin"],
                                        form["password"],
                                      ));
                                },
                                label: "Login as Admin",
                                basic: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: theme.textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: ColorTheme.primaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    context.goNamed(SignUpPage.route, extra: {
                                      "authBloc": context.read<AuthBloc>(),
                                    }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
