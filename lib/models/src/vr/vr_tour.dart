import 'package:flutter_app/models/models.dart';

class VrTour {
  Map<String, int> scenesIdsMap;
  String firstSceneCode;
  String? firstSceneId;
  List<VrTourScene> scenes;

  VrTour(
      {required this.scenesIdsMap,
      required this.firstSceneCode,
      required this.scenes,
      this.firstSceneId});

  factory VrTour.fromJson(Map<String, dynamic> parsedJson) {
    List<VrTourScene> _scenes = [];
    if (parsedJson["tourScenes"] != null) {
      List _hotspotsList = parsedJson["tourScenes"];
      _scenes = _hotspotsList.map((e) => VrTourScene.fromJson(e)).toList();
    }
    return VrTour(
      scenes: _scenes,
      firstSceneCode: parsedJson["firstScene"],
      scenesIdsMap: {},
    );
  }
}
