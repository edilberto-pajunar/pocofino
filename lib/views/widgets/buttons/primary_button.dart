import 'package:flutter/material.dart';
import 'package:pocofino/config/strings/color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPressed,
    required this.label,
    super.key,
  });

  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorTheme.primaryColor,
      ),
      child: Text(
        label,
        style: theme.textTheme.bodyMedium!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
