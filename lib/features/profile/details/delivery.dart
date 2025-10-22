import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/features/data/models/app_lat_long.dart';
import 'package:homework1/features/data/services/app_location_service.dart';
import 'package:homework1/widgets/custom_appbar.dart';
import 'package:homework1/widgets/custom_text_style.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => DeliveryState();
}

class DeliveryState extends State<Delivery> {
  // late GoogleMapController mapController;
  // final LatLng _center = const LatLng(43.238949, 76.889709); // Almaty center
  //
  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }


  final mapControllerCompleter = Completer<YandexMapController>();

  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          hasLeading: true,
          title: AppLocalizations.of(context)?.translate("delivery") ?? "delivery",
          hasActions: false
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextStyle(
              text:
                  AppLocalizations.of(context)?.translate("delivery_text") ??
                  "Доставка",
              isBold: false,
              isCenter: false,
            ),

            SizedBox(height: 16),

            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: YandexMap(
                  onMapCreated: (controller) {
                    mapControllerCompleter.complete(controller);
                  },
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = AlmatiLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    _moveToCurrentLocation(AlmatiLocation());
  }

  Future<void> _moveToCurrentLocation(
      AppLatLong appLatLong,
      ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 12,
        ),
      ),
    );
  }
}
