import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';
import 'package:pocofino/widgets/fields/primary_text_field.dart';

class EditAccountView extends StatefulWidget {
  const EditAccountView({super.key});

  @override
  State<EditAccountView> createState() => _EditAccountViewState();
}

class _EditAccountViewState extends State<EditAccountView> {
  final GlobalKey<FormFieldState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: FormBuilder(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const PrimaryTextField(
                name: "firstName",
                label: "First Name",
                hintText: "Frennie Marie",
              ),
              const PrimaryTextField(
                name: "lastName",
                label: "Last Name",
                hintText: "Largado",
              ),
              const PrimaryTextField(
                name: "mobile",
                label: "Mobile Number",
                hintText: "XXXXXXXXXXX",
              ),
              const PrimaryTextField(
                name: "email",
                label: "Email",
                hintText: "fmllargado@gmail.com",
              ),
              const SizedBox(height: 24.0),
              PrimaryButton(
                onPressed: () {},
                label: "Save Changes",
              ),
              const SizedBox(height: 12.0),
              PrimaryButton(
                onPressed: () {},
                basic: true,
                label: "Delete Account",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
