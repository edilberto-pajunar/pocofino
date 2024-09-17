import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:location_repository/location_repository.dart';
import 'package:pocofino/features/order/bloc/order_bloc.dart';
import 'package:pocofino/widgets/buttons/primary_button.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late final MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  final locations = [
    const LatLng(14.552474, 121.048677),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Branch"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.red,
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialZoom: 18.0,
                  initialCenter: locations[0],
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: locations[0],
                        child: const Icon(
                          Icons.place,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.stores.length,
                  itemBuilder: (context, index) {
                    final store = state.stores[index];

                    final openingHour = store.formattedTime(store.openingHours);
                    final closingHour = store.formattedTime(store.closingHours);

                    return InkWell(
                      onTap: () {
                        context
                          ..read<OrderBloc>().add(OrderStoreSubmitted(store))
                          ..pop();
                      },
                      child: Container(
                        color: state.store == store
                            ? theme.colorScheme.primary
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                store.name,
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(store.address),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    store.open24Hours!
                                        ? "Open 24 Hours"
                                        : "$openingHour - $closingHour",
                                    style:
                                        theme.textTheme.labelMedium!.copyWith(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    "11 miles",
                                    style: theme.textTheme.labelLarge,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: PrimaryButton(
          //     onPressed: () {},
          //     label: "Confirm",
          //   ),
          // ),
        ],
      ),
    );
  }
}
