import 'package:flutter/material.dart';
import 'package:pocofino/features/activity/widget/completed_view.dart';
import 'package:pocofino/features/activity/widget/ongoing_view.dart';
import 'package:pocofino/utils/strings/color.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

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
            OngoingView(),
            CompletedView(),
          ],
        ),
      ),
    );
  }
}
