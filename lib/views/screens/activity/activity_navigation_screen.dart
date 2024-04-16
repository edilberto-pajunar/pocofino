import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocofino/config/strings/color.dart';
import 'package:pocofino/views/screens/activity/completed_screen.dart';
import 'package:pocofino/views/screens/activity/ongoing_screen.dart';

@RoutePage()
class ActivityNavigationScreen extends StatelessWidget {
  const ActivityNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Text(
                "Ongoing",
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: ColorTheme.primaryColor,
                ),
              ),
              Text(
                "Completed",
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: ColorTheme.primaryColor,
                ),
              ),
            ],
            unselectedLabelColor: ColorTheme.primaryColor,
            indicatorColor: ColorTheme.primaryColor,
            labelPadding: const EdgeInsets.only(bottom: 10),
          ),
        ),
        body: const TabBarView(
          children: [
            ActivityOngoingScreen(),
            ActivityCompletedScreen(),
          ],
        ),
      ),
    );
  }
}
