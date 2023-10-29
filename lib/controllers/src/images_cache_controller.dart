import 'dart:typed_data';

import 'package:flutter/services.dart';

class ImagesCache {
  static Map<String, Uint8List> images = {};

  ImagesCache._();

  static clearCache() {
    images.clear();
  }

  static Future<Uint8List> load(String url) async {
    if (images[url] != null) {
      return images[url]!;
    }
    try {
      Uint8List _image = (await NetworkAssetBundle(Uri.parse(url)).load(url)).buffer.asUint8List();
      images[url] = _image;
      return _image;
    } catch (e) {
      throw Exception("failed to load assets");
    }
  }

  static Future<List<Uint8List>> loadImages(List<String> urls) async {
    List<Uint8List> _memoryImage = [];

    for (String url in urls) {
      if (images[url] != null) {
        _memoryImage.add(images[url]!);
        continue;
      }
      Uint8List _image = (await NetworkAssetBundle(Uri.parse(url)).load(url)).buffer.asUint8List();
      images[url] = _image;
      _memoryImage.add(_image);
    }

    return _memoryImage;
  }
}
