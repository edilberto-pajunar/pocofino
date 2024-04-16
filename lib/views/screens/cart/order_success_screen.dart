import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocofino/config/strings/color.dart';
import 'package:pocofino/views/widgets/buttons/primary_button.dart';

@RoutePage()
class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundColor: ColorTheme.primaryColor,
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40.0),
            Text(
              "Your Order has been Placed Successfully!",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 40.0),
            const Text(
              "Thank you for placing your order! Your request has been successfully submitted and is now being prepared. Sit tight, and we'll notify you through the app once everything's set.  Enjoy your day!",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Text(
              "Track Order",
              style: theme.textTheme.bodyMedium!.copyWith(
                color: ColorTheme.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: ColorTheme.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 65.0),
            PrimaryButton(
              onPressed: () => AutoRouter.of(context).popUntilRoot(),
              label: "Continue Shopping",
            ),
          ],
        ),
      ),
    );
  }
}
