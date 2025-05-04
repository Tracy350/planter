import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({super.key});

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  final MapController mapController = MapController();
  final Location location = Location();

  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  @override
  void initState() {
    super.initState();
    initLocation();
  }

  Future<void> initLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) return;
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }

    if (_permissionGranted != PermissionStatus.granted) {
      // You could show a snackbar or dialog here to notify the user
      return;
    }

    final locData = await location.getLocation();

    if (!mounted) return;

    setState(() {
      _locationData = locData;
      log(_locationData.toString());
    });

    mapController.move(
      LatLng(_locationData!.latitude!, _locationData!.longitude!),
      15,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _locationData == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    initialCenter: LatLng(
                      _locationData!.latitude!,
                      _locationData!.longitude!,
                    ),
                    initialZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://api.mapbox.com/styles/v1/{id}/tiles/256/{z}/{x}/{y}?access_token={accessToken}",
                      userAgentPackageName:
                          'dev.fleaflet.flutter_map.example',
                      additionalOptions: {
                        'accessToken':
                            'pk.eyJ1IjoiY2hhbGxlbmdlIiwiYSI6ImNreW5vZ3VqYjA4d3YycXJ0dG5nZ2RkZ3gifQ.9g7m8l4r7f8f8f8f8f8f8f8',
                        'id': 'mapbox/streets-v11',
                      },
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
