import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocofino/config/router/router.gr.dart';
import 'package:pocofino/config/strings/color.dart';
import 'package:pocofino/config/strings/images.dart';
import 'package:pocofino/views/widgets/buttons/primary_button.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            Image.asset(PngImages.onboarding),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: size.height * 0.1),
                    Text(
                      "it's the\nsmall fine\nthings.",
                      style: theme.textTheme.titleLarge!.copyWith(
                        fontFamily: "Bely Display",
                        color: ColorTheme.primaryColor,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    PrimaryButton(
                      onPressed: () => context.pushRoute(const CreateAccountRoute()),
                      label: "Get Started",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
