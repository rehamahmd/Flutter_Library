import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/web_view/in_app_web_view_widget.dart';
import 'package:flutter_app/views/screens/galleries/gallery_3/image_widget.dart';
import 'package:flutter_app/views/screens/galleries/gallery_3/sound_cloud_widget.dart';
import 'package:flutter_app/views/screens/galleries/gallery_3/youtube_widget.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GalleryInRow extends StatelessWidget {
  final String url;
  const GalleryInRow({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (["png", 'jpg'].contains(url.split(".").last)) {
      return ImageWidget(url: url);
    }

    String? _youTubeId = YoutubePlayer.convertUrlToId(url);
    Uri _uri = Uri.parse(url);

    if (_uri.host == "www.soundcloud.com" || _uri.host == "soundcloud.com") {
      return SoundCloudWidget(url: url);
    } else if (_youTubeId != null) {
      return YoutubeWidget(id: _youTubeId);
    }
    return InAppWebViewWidget(uri: _uri);
  }
}
