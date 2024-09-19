import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pocofino/app/bloc/app_bloc.dart';
import 'package:pocofino/features/account/view/account_page.dart';
import 'package:pocofino/features/activity/view/activity_page.dart';
import 'package:pocofino/features/admin/features/home/view/admin_home_page.dart';
import 'package:pocofino/features/auth/view/login_page.dart';
import 'package:pocofino/features/cart/view/cart_page.dart';
import 'package:pocofino/features/menu/view/menu_page.dart';
import 'package:pocofino/features/wallet/view/wallet_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

typedef TabWidgetRecord = ({Widget tabView, Widget tabBarItem});

class _HomeViewState extends State<HomeView> {
  final List<TabWidgetRecord> homeTabWidgetRecords = [
    (
      tabBarItem: const NavigationDestination(
        icon: Icon(Icons.home_outlined),
        label: "Home",
      ),
      tabView: const MenuPage(),
    ),
    (
      tabBarItem: const NavigationDestination(
        icon: Icon(Icons.track_changes_rounded),
        label: "Activity",
      ),
      tabView: const ActivityPage(),
    ),
    (
      tabBarItem: const NavigationDestination(
        icon: Icon(Icons.account_balance_wallet_outlined),
        label: "Wallet",
      ),
      tabView: const WalletPage(),
    ),
    (
      tabBarItem: const NavigationDestination(
        icon: Icon(Icons.local_grocery_store_outlined),
        label: "Cart",
      ),
      tabView: const CartPage(),
    ),
    (
      tabBarItem: const NavigationDestination(
        icon: Icon(Icons.track_changes_outlined),
        label: "Account",
      ),
      tabView: const AccountPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final status = context.watch<AppBloc>().state.status;
    final isAdmin = context.watch<AppBloc>().state.currentUser?.isAdmin;

    if (status != AppStatus.authenticated) {
      return const LoginPage();
    }

    return isAdmin!
        ? const AdminHomePage()
        : BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return PopScope(
                canPop: false,
                child: Scaffold(
                  bottomNavigationBar: NavigationBar(
                    selectedIndex: state.tabIndex,
                    onDestinationSelected: (selectedIndex) => context
                        .read<AppBloc>()
                        .add(AppHomeIndexChanged(selectedIndex)),
                    destinations: homeTabWidgetRecords
                        .map((tabRecord) => tabRecord.tabBarItem)
                        .toList(),
                  ),
                  body: homeTabWidgetRecords
                      .map((tabRecord) => tabRecord.tabView)
                      .toList()[state.tabIndex],
                ),
              );
            },
          );
  }
}
