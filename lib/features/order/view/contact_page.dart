
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';
import 'package:pocofino/features/order/view/contact_view.dart';

class ContactPage extends StatelessWidget {
  static String route = "contact_page_route";
  const ContactPage({
    required this.orderBloc,
    super.key,
  });

  final OrderBloc orderBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: orderBloc,
      child: const ContactView(),
    );
  }
}
