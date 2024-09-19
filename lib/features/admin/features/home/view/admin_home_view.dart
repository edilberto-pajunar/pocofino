import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/app/bloc/app_bloc.dart';
import 'package:pocofino/features/admin/features/home/widget/sales.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ADMIN"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: TextButton(
              onPressed: () {
                context.read<AppBloc>().add(AppLogoutRequested());
              },
              child: const Text("Logout"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Sales(),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pending Orders",
                    style: theme.textTheme.titleLarge,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_alt),
                  ),
                ],
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Order #: 123456"),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("June 03, 2024 01:02:00 am"),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Mark as complete",
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  Expanded(
                    child: ActionContainer(
                      text: "ADD",
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: ActionContainer(
                      text: "UPDATE",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  Expanded(
                    child: ActionContainer(
                      text: "VIEW",
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: ActionContainer(
                      text: "DELETE",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionContainer extends StatelessWidget {
  const ActionContainer({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.grey,
        ),
        height: 150,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
