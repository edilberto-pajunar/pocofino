import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/features/account/view/app_settings_page.dart';
import 'package:pocofino/features/account/view/edit_account_page.dart';
import 'package:pocofino/features/account/view/help_center_page.dart';
import 'package:pocofino/utils/strings/color.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () => context.goNamed(EditAccountPage.route),
              borderRadius: BorderRadius.circular(12.0),
              child: InkWell(
                radius: 48.0,
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
                  onTap: () => context.goNamed(AppSettingsPage.route),
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
                  onTap: () => context.goNamed(HelpCenterPage.route),
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
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("Logout"),
                            content:
                                const Text("Are you sure you want to logout?"),
                            actions: [
                              PrimaryButton(
                                basic: true,
                                onPressed: () => Navigator.pop(context),
                                label: "Cancel",
                              ),
                              PrimaryButton(
                                onPressed: () => Navigator.pop(context),
                                label: "Logout",
                              ),
                            ],
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
