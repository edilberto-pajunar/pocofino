import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/admin/features/home/bloc/admin_bloc.dart';
import 'package:pocofino/features/admin/features/home/view/admin_home_view.dart';

class AdminHomePage extends StatelessWidget {
  static String route = "admin_home_page_route";
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminBloc(),
      child: const AdminHomeView(),
    );
  }
}
