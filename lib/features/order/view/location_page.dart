import 'package:flutter/material.dart';
import 'package:pocofino/features/order/view/location_view.dart';

class LocationPage extends StatelessWidget {
  static String route = "location_page_route";
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LocationView();
  }
}
