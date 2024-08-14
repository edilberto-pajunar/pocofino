import 'package:activity_repository/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocofino/app/view/bloc/app_bloc.dart';
import 'package:pocofino/features/activity/bloc/activity_bloc.dart';
import 'package:pocofino/features/activity/view/activity_view.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';

class ActivityPage extends StatelessWidget {
  static String route = "activity_page_route";
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: context.read<OrderBloc>(),
        ),
        BlocProvider(
          create: (context) => ActivityBloc(
            activityRepository: context.read<ActivityRepository>(),
            token: context.read<AppBloc>().state.token!,
          )..add(ActivityInitRequested()),
        ),
      ],
      child: BlocListener<ActivityBloc, ActivityState>(
        listener: (context, state) {
          if (state.status == ActivityStatus.failed) {
            Fluttertoast.showToast(msg: state.error!);
          }
        },
        child: const ActivityView(),
      ),
    );
  }
}
