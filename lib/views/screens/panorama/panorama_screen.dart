import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/enums/enums.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/panorama/vr_tour_view.dart';

class PanoramaScreen extends StatefulWidget {
  const PanoramaScreen({Key? key}) : super(key: key);

  @override
  State<PanoramaScreen> createState() => _PanoramaScreenState();
}

class _PanoramaScreenState extends State<PanoramaScreen> {
  final _tour = VrTour(
      scenesIdsMap: {"0": 0, "1": 1, "2": 2},
      firstSceneCode: "0",
      scenes: List.generate(3, (index) {
        return VrTourScene(
            code: '$index',
            id: index.toString(),
            image: [
              "https://images.pixexid.com/9j71bvl-haulover-sandbar-aerial-360.jpeg?h=1400",
              "https://images.pixexid.com/r7j0lvz-360-panorama-miami-beach.jpeg?h=1400",
              "https://images.pixexid.com/sb0criu-360-panorama-shore.jpeg?h=1400",
            ].elementAt(index % 3),
            hotspots: List.generate(
              8,
              (hotspotIndex) {
                return SceneHotspot(
                    latitude: 10.0 * hotspotIndex,
                    longitude: 30.0 * hotspotIndex,
                    label: "label $hotspotIndex",
                    type: hotspotIndex > 2 ? HotspotTypes.info : HotspotTypes.scene,
                    id: '$hotspotIndex',
                    sceneId: index >= 2 ? "0" : "${index + 1}");
              },
            ));
      }));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VrTourView(
        tour: _tour,
      ),
    );
  }
}

class PanoramaButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const PanoramaButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.all(2), backgroundColor: Colors.black38),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text(text),
          ],
        ));
  }
}
