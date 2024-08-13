import 'package:flutter/material.dart';
import 'package:pocofino/utils/strings/color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPressed,
    required this.label,
    this.basic = false,
    super.key,
  });

  final Function()? onPressed;
  final String label;
  final bool basic;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: basic ? null : ColorTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            width: onPressed == null ? 0 : 1.0,
            color: ColorTheme.primaryColor,
          ),
        ),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodyMedium!.copyWith(
          color: basic ? ColorTheme.primaryColor : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
