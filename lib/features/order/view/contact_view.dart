import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';
import 'package:pocofino/widgets/fields/primary_text_field.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Information"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: FormBuilder(
          onChanged: () => _formKey.currentState!.save(),
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PrimaryTextField(
                name: "mobile",
                label: "Phone Number",
                hintText: "Enter your mobile number",
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(10),
                ]),
              ),
              PrimaryTextField(
                name: "firstName",
                label: "First Name",
                hintText: "Juan",
                validator: FormBuilderValidators.required(),
              ),
              PrimaryTextField(
                name: "lastName",
                label: "Last Name",
                hintText: "Dela Cruz",
                validator: FormBuilderValidators.required(),
              ),
              const Spacer(),
              PrimaryButton(
                onPressed: () {
                  final form = _formKey.currentState?.value;
                  if (_formKey.currentState!.validate()) {
                    context
                      ..read<OrderBloc>().add(OrderContactInformationSubmitted(
                          mobileNumber: form?["mobile"],
                          firstName: form?["firstName"],
                          lastName: form?["lastName"]))
                      ..pop();
                  }
                },
                label: "Confirm",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
