import 'package:flutter_app/enums/enums.dart';

class SceneHotspot {
  String id;
  double latitude;
  double longitude;
  String? sceneId;
  String? label;
  int? pieceId;
  HotspotTypes type;
  // todo may be removed
  /// to store pieces data if loaded when open pieces

  SceneHotspot({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.label,
    required this.sceneId,
    this.type = HotspotTypes.scene,
  });

  factory SceneHotspot.fromJson(Map<String, dynamic> parsedJson) {
    return SceneHotspot(
      id: parsedJson["hotspotId"] ?? "",
      latitude: double.tryParse(parsedJson["pitch"]) ?? 0.0,
      longitude: double.tryParse(parsedJson["yaw"]) ?? 0.0,
      sceneId: parsedJson["targetScene"],
      label: parsedJson["text"],
      type: parsedJson["type"] == "info" ? HotspotTypes.info : HotspotTypes.scene,
    );
  }
}
