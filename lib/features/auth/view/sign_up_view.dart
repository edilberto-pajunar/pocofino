import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pocofino/features/auth/bloc/auth_bloc.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';
import 'package:pocofino/widgets/fields/primary_text_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
                  FormBuilder(
                    key: widget.formKey,
                    onChanged: () => widget.formKey.currentState!.save(),
                    skipDisabled: true,
                    child: Column(
                      children: [
                        PrimaryTextField(
                          label: "Name",
                          name: "name",
                          hintText: "name",
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        PrimaryTextField(
                          label: "Username",
                          name: "username",
                          hintText: "username",
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
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
                  PrimaryButton(
                    onPressed: () {
                      if (widget.formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(AuthCreateAccountRequested(
                              username: widget
                                  .formKey.currentState!.value["username"],
                              name: widget.formKey.currentState!.value["name"],
                              email:
                                  widget.formKey.currentState!.value["email"],
                              password: widget
                                  .formKey.currentState!.value["password"],
                            ));
                      }
                    },
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
