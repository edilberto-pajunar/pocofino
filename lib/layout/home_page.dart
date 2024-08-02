import 'package:flutter/material.dart';
import 'package:pocofino/features/account/view/account_page.dart';
import 'package:pocofino/features/activity/view/activity_page.dart';
import 'package:pocofino/features/cart/view/cart_page.dart';
import 'package:pocofino/features/menu/view/menu_page.dart';
import 'package:pocofino/features/wallet/view/wallet_page.dart';

typedef TabWidgetRecord = ({Widget tabView, Widget tabBarItem});

class HomePage extends StatefulWidget {
  static String route = "home_page_route";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: homeTabWidgetRecords
            .map((tabRecord) => tabRecord.tabView)
            .toList()[tabIndex],
      ),
    );
  }
}
