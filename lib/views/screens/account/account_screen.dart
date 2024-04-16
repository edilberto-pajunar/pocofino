import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocofino/config/strings/color.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorTheme.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.edit,
                      size: 15.0,
                      color: ColorTheme.primaryColor,
                    ),
                    Text(
                      "Edit Profile",
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: ColorTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: ColorTheme.primaryColor.withOpacity(0.1),
            child: const Text("F"),
          ),
          const SizedBox(height: 20.0),
          Text(
            "Frennie Marie Largado",
            style: theme.textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15.0),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 15.0),
                  Text(
                    "09777631040",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 15.0),
                  Text(
                    "fmllargado@gmail.com",
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: ColorTheme.primaryColor,
                  ),
                  title: const Text("App Settings"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: ColorTheme.primaryColor,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.question_mark,
                    color: ColorTheme.primaryColor,
                  ),
                  title: const Text("Help Center"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: ColorTheme.primaryColor,
                  ),
                ),
                const SizedBox(height: 80),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: ColorTheme.primaryColor,
                  ),
                  title: const Text("Logout"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: ColorTheme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
