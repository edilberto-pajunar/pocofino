import 'package:flutter/material.dart';
import 'package:pocofino/widgets/fields/primary_text_field.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.notifications_none,
              color: theme.primaryColor,
            ),
            title: const Text("Notifications"),
            subtitle: Text(
              "Turn on your notification to receive updates",
              style: theme.textTheme.labelSmall!.copyWith(),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right_outlined,
              color: theme.primaryColor,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.location_on_outlined,
              color: theme.primaryColor,
            ),
            title: const Text("Location"),
            subtitle: Text(
              "Turn on your notification to receive updates",
              style: theme.textTheme.labelSmall!.copyWith(),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right_outlined,
              color: theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
