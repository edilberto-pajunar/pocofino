import 'package:flutter/material.dart';
import 'package:pocofino/features/activity/view/activity_view.dart';

class ActivityPage extends StatelessWidget {
  static String route = "activity_page_route";
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ActivityView();
  }
}
