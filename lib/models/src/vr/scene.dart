import 'package:flutter_app/models/models.dart';

class VrTourScene {
  String id;
  String? code;
  String image;
  List<SceneHotspot>? hotspots;

  VrTourScene({required this.id, required this.image, required this.code, this.hotspots});

  factory VrTourScene.fromJson(Map<String, dynamic> parsedJson) {
    List<SceneHotspot> _hotspots = [];
    if (parsedJson["sceneHotspots"] != null) {
      List _hotspotsList = parsedJson["sceneHotspots"];
      _hotspots = _hotspotsList.map((e) => SceneHotspot.fromJson(e)).toList();
    }
    return VrTourScene(
      id: parsedJson["sceneId"],
      code: parsedJson["sceneCodeName"],
      image: parsedJson["panorama"],
      hotspots: _hotspots,
    );
  }
}
