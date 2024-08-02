import 'package:flutter/material.dart';
import 'package:pocofino/features/menu/view/menu_view.dart';

class MenuPage extends StatelessWidget {
  static String route = "menu_page_route";
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuView();
  }
}
