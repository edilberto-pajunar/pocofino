import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocofino/config/router/router.gr.dart';
import 'package:pocofino/config/strings/color.dart';

@RoutePage()
class HomeNavigationScreen extends StatelessWidget {
  const HomeNavigationScreen({super.key});

  static final _items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Icons.track_changes_rounded), label: "Activity"),
    const BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: "Wallet"),
    const BottomNavigationBarItem(icon: Icon(Icons.local_grocery_store_outlined), label: "Cart"),
    const BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "Account"),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ActivityNavigationRoute(),
        WalletRoute(),
        CartRoute(),
        AccountRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          items: _items,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          unselectedItemColor: ColorTheme.blackColor,
          selectedItemColor: ColorTheme.primaryColor,
          showUnselectedLabels: true,
        );
      },
    );
  }
}
