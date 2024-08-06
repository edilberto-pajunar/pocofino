import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';
import 'package:pocofino/widgets/fields/primary_text_field.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();

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
              const PrimaryTextField(
                name: "mobile",
                label: "Phone Number",
                hintText: "Enter your mobile number",
              ),
              const PrimaryTextField(
                name: "firstName",
                label: "First Name",
                hintText: "Juan",
              ),
              const PrimaryTextField(
                name: "lastName",
                label: "Last Name",
                hintText: "Dela Cruz",
              ),
              const SizedBox(height: 120),
              PrimaryButton(
                onPressed: () {
                  context.pop();
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
