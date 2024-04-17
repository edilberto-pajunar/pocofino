import 'package:flutter/material.dart';
import 'package:pocofino/config/strings/color.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required this.label,
    super.key,
  });

  final String label;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        TextFormField(
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorTheme.primaryColor,
                ),
              ),
              suffixIcon: IconButton(
                icon: isObscure ? const Icon(Icons.remove_red_eye_outlined) : const Icon(Icons.remove_red_eye),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )),
          obscureText: isObscure,
        ),
      ],
    );
  }
}
