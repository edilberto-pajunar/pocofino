import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/auth/bloc/auth_bloc.dart';
import 'package:pocofino/features/auth/view/login_page.dart';
import 'package:pocofino/features/menu/view/menu_page.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';
import 'package:pocofino/widgets/fields/primary_text_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({
    super.key,
  });

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey();

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormBuilder(
                    key: formKey,
                    onChanged: () => formKey.currentState!.save(),
                    skipDisabled: true,
                    child: Column(
                      children: [
                        PrimaryTextField(
                          label: "Username",
                          name: "username",
                          hintText: "username",
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        // PrimaryTextField(
                        //   label: "First Name",
                        //   name: "firstName",
                        //   hintText: "Juan",
                        //   validator: FormBuilderValidators.compose([
                        //     FormBuilderValidators.required(),
                        //   ]),
                        // ),
                        // PrimaryTextField(
                        //   label: "Last Name",
                        //   name: "lastName",
                        //   hintText: "Dela Cruz",
                        //   validator: FormBuilderValidators.compose([
                        //     FormBuilderValidators.required(),
                        //   ]),
                        // ),
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
                        context.goNamed(MenuPage.route);
                      }
                    },
                    builder: (context, state) {
                      return state.status == AuthStatus.loading
                          ? const CircularProgressIndicator()
                          : Column(
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: "Already have an account? ",
                                      style: theme.textTheme.bodyMedium,
                                      children: [
                                        TextSpan(
                                          text: "Log in",
                                          style: theme.textTheme.bodyMedium!
                                              .copyWith(
                                            color: ColorTheme.primaryColor,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => context.goNamed(
                                                    LoginPage.route,
                                                    extra: {
                                                      "authBloc": context
                                                          .read<AuthBloc>(),
                                                    }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                                PrimaryButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      final formValue =
                                          formKey.currentState?.value;

                                      context
                                          .read<AuthBloc>()
                                          .add(AuthCreateAccountRequested(
                                            username: formValue?["username"],
                                            email: formValue?["email"],
                                            password: formValue?["password"],
                                          ));
                                    }
                                  },
                                  label: "Sign Up",
                                ),
                              ],
                            );
                    },
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
                  // RichText(
                  //   textAlign: TextAlign.center,
                  //   text: TextSpan(
                  //     text: "Already have an account? ",
                  //     style: theme.textTheme.bodyMedium,
                  //     children: [
                  //       TextSpan(
                  //         text: "Login",
                  //         style: theme.textTheme.bodyMedium!.copyWith(
                  //           color: ColorTheme.primaryColor,
                  //         ),
                  //         recognizer: TapGestureRecognizer()
                  //           ..onTap = () => context.read<AuthBloc>().add(
                  //               const AuthScreenTriggered(AuthStatus.logIn)),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}
