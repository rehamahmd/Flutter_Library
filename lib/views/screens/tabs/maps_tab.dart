import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_button.dart';
import 'package:flutter_app/views/screens/maps/app_location_picker.dart';
import 'package:flutter_app/views/screens/maps/location_picker.dart';
import 'package:flutter_app/views/screens/maps/multi_locations_view.dart';
import 'package:flutter_app/views/screens/maps/two_location_view.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:flutter_app/views/ui_dummy_data/maps/maps_data.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsTab extends StatefulWidget {
  const MapsTab({Key? key}) : super(key: key);

  @override
  State<MapsTab> createState() => _MapsTabState();
}

class _MapsTabState extends State<MapsTab> {
  LatLng? _location;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        SizedBox(
            height: AppResponsive.size.shortestSide,
            width: AppResponsive.size.shortestSide,
            child: LocationPicker(
              markLocation: _location,
            )),
        //SizedBox(height: 16 * AppResponsive.scaleFactor,),
        AppButton(
          text: "Pick Location",
          onPressed: () async {
            LatLng? _temp = await Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => AppLocationPicker())) as LatLng?;
            if (_temp != null) {
              _location = _temp;
              setState(() {});
            }
          },
        ),
        SizedBox(
          height: 16 * AppResponsive.scaleFactor,
        ),
        SizedBox(
            height: AppResponsive.size.shortestSide,
            width: AppResponsive.size.shortestSide,
            child: MultiLocationsView(
              places: MapsData.items,
              initialCameraPosition: LatLng(48.75449875000001, 2.32211125),
            )),
        AppButton(
          text: "Test in Full Screen",
          onPressed: () async {
            LatLng? _temp = await Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => Scaffold(
                      body: SizedBox.expand(
                          child: MultiLocationsView(
                        places: MapsData.items,
                        initialCameraPosition: LatLng(48.75449875000001, 2.32211125),
                      )),
                    ))) as LatLng?;
            if (_temp != null) {
              _location = _temp;
              setState(() {});
            }
          },
        ),
        SizedBox(
          height: 16 * AppResponsive.scaleFactor,
        ),
        SizedBox(
          height: AppResponsive.size.shortestSide,
          width: AppResponsive.size.shortestSide,
          child: const TwoLocationView(
            startLocation: LatLng(48.848200, 2.319124),
            endLocation: LatLng(48.848200, 10.319124),
          ),
        ),
        AppButton(
          text: "Test in Full Screen",
          onPressed: () async {
            LatLng? _temp = await Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const Scaffold(
                      body: SizedBox.expand(
                        child: TwoLocationView(
                          startLocation: LatLng(48.848200, 2.319124),
                          endLocation: LatLng(48.848200, 30.319124),
                        ),
                      ),
                    ))) as LatLng?;
            if (_temp != null) {
              _location = _temp;
              setState(() {});
            }
          },
        ),
        SizedBox(
          height: 16 * AppResponsive.scaleFactor,
        ),
      ],
    );
  }
}
