import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pocofino/utils/strings/images.dart';

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
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label),
          FormBuilderTextField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            name: widget.name,
            maxLines: widget.maxLines,
            obscureText: widget.isPassword && obscureText,
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
                  : InkWell(
                      borderRadius: BorderRadius.circular(45.0),
                      onTap: () => setState(() {
                        obscureText = !obscureText;
                      }),
                      child: Image.asset(
                        obscureText ? PngImages.hidePass : PngImages.showPass,
                      ),
                    ),
              hintText: widget.hintText,
            ),
            validator: widget.validator,
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
