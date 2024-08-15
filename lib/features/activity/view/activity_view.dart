import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/activity/bloc/activity_bloc.dart';
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
            onTap: (index) {
              if (index == 0) {
                context
                    .read<ActivityBloc>()
                    .add(const ActivityOrdersRequested("pending"));
              }

              if (index == 1) {
                context
                    .read<ActivityBloc>()
                    .add(const ActivityOrdersRequested("completed"));
              }
            },
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
        body: BlocSelector<ActivityBloc, ActivityState, ActivityStatus>(
          selector: (state) => state.status,
          builder: (context, state) {
            return state == ActivityStatus.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const TabBarView(
                    children: [
                      OngoingView(),
                      CompletedView(),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
