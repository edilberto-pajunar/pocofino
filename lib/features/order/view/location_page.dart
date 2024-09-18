
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';
import 'package:pocofino/features/order/view/location_view.dart';

class LocationPage extends StatelessWidget {
  static String route = "location_page_route";
  const LocationPage({
    required this.orderBloc,
    super.key,
  });

  final OrderBloc orderBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: orderBloc,
      child: const LocationView(),
    );
  }
}
