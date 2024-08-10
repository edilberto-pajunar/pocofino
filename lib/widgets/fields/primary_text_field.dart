import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    required this.name,
    required this.label,
    required this.hintText,
    this.validator,
    this.isPassword = false,
    this.maxLines = 1,
    super.key,
  });

  final String name;
  final String label;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final int maxLines;

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        FormBuilderTextField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          name: widget.name,
          maxLines: widget.maxLines,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 12.0,
            ),
            suffixIcon: !widget.isPassword
                ? null
                : IconButton(
                    icon: const Icon(Icons.password),
                    onPressed: () => setState(() {
                      obscureText = !obscureText;
                    }),
                  ),
            hintText: widget.hintText,
          ),
          validator: widget.validator,
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
