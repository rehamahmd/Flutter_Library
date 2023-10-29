import 'dart:math';

import 'package:flutter_app/enums/enums.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/styles/styles.dart';

class GalleryData {
  static List<String> galleryLinks = [
    "https://www.presidency.eg/media/163551/p-8-00000000000jpg.jpg",
    "https://www.presidency.eg/media/163557/p-3-000jpg.jpg",
    "https://www.presidency.eg/media/163553/p-1-000jpg.jpg",
    "https://youtu.be/8YRL_57pF6c",
    "https://soundcloud.com/mrfavo/two-steps-from-hell-victory",
    "https://www.youtube.com/embed/pICAha0nsb0"
  ];
  static List<GalleryModel> getGalleryList() {
    // Dummy Gallery List
    List<GalleryModel> galleryList = [
      GalleryModel(title: '', url: AppIcons.networkImage_1, type: GalleryType.image),
      GalleryModel(title: '', url: AppIcons.networkImage_2, type: GalleryType.image),
      GalleryModel(
          title: '',
          url: 'https://soundcloud.com/ishraq-zahde/dy8jvciznv6q',
          type: GalleryType.soundCloud),
      GalleryModel(title: '', url: AppIcons.networkImage_3, type: GalleryType.image),
      GalleryModel(title: '', url: 'K8C4yr7zavE', type: GalleryType.youtubeVideo)
    ];
    return galleryList;
  }
}
