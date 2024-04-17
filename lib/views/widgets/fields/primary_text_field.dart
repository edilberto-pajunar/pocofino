import 'package:flutter/material.dart';
import 'package:pocofino/config/strings/color.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorTheme.primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
