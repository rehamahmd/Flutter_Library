import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_app/enums/enums.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/panorama/hotspot_button.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:panorama/panorama.dart';

class PanoramaView extends StatefulWidget {
  final VrTourScene scene;
  final Uint8List image;
  final Function(String) onChange;

  const PanoramaView({Key? key, required this.scene, required this.image, required this.onChange})
      : super(key: key);

  @override
  State<PanoramaView> createState() => _PanoramaViewState();
}

class _PanoramaViewState extends State<PanoramaView> {
  @override
  Widget build(BuildContext context) {
    return Panorama(
      sensitivity: 2.0,
      child: Image.memory(
        widget.image,
      ),
      hotspots: widget.scene.hotspots?.map((e) {
        double _itemSize = 300 * AppResponsive.scaleFactor;
        return Hotspot(
            latitude: e.latitude,
            longitude: e.longitude,
            height: 150 * AppResponsive.scaleFactor,
            width: 300 * AppResponsive.scaleFactor,
            widget: HotspotButton(
              hotspot: e,
              onPressed: () {
                switch (e.type) {
                  case HotspotTypes.info:
                    break;
                  case HotspotTypes.scene:
                    widget.onChange(e.sceneId!);

                    break;
                }
              },
            ));
      }).toList(),
    );
  }
}
