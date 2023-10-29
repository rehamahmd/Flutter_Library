import 'package:flutter/material.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/views/styles/src/map_themes.dart';
import 'package:flutter_app/views/styles/styles.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class LocationPicker extends StatefulWidget {
  final LatLng? markLocation;
  const LocationPicker({
    Key? key,
    this.markLocation,
  }) : super(key: key);

  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  GoogleMapController? _googleMapController;
  late ThemeProvider _themeProvider;

  _updateCamera(LatLng location) {
    _googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: location,
        zoom: 14,
      ),
    ));
    _googleMapController?.showMarkerInfoWindow(const MarkerId("MarkerId"));
  }

  _setMapTheme() async {
    if (_googleMapController == null) return;
    switch (_themeProvider.themeMode) {
      case ThemeMode.light:
        await _googleMapController!.setMapStyle(MapThemes.light);
        break;
      case ThemeMode.dark:
        await _googleMapController!.setMapStyle(MapThemes.dark);
        break;
      default:
        if (AppResponsive.mediaQueryData.platformBrightness == Brightness.dark) {
          await _googleMapController!.setMapStyle(MapThemes.dark);
        } else {
          await _googleMapController!.setMapStyle(MapThemes.light);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _themeProvider = Provider.of<ThemeProvider>(context);

    if (_googleMapController != null && widget.markLocation != null) {
      _updateCamera(widget.markLocation!);
    }
    _setMapTheme();
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: widget.markLocation ?? const LatLng(26.8206, 30.8025),
        zoom: 5.5,
      ),
      markers: widget.markLocation == null
          ? {}
          : {
              Marker(
                  markerId: const MarkerId("MarkerId"),
                  infoWindow: const InfoWindow(title: "location name", snippet: "description"),
                  position: widget.markLocation!)
            },
      onMapCreated: (GoogleMapController controller) {
        _googleMapController = controller;
        _setMapTheme();
      },
    );
  }
}
