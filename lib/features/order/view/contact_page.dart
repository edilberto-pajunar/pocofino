import 'package:flutter/material.dart';
import 'package:pocofino/features/order/view/contact_view.dart';

class ContactPage extends StatelessWidget {
  static String route = "contact_page_route";
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContactView();
  }
}
