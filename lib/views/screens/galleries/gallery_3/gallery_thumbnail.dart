import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/loaders/image_loader.dart';
import 'package:flutter_app/views/styles/src/app_responsive.dart';

import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GalleryThumbnail extends StatelessWidget {
  final String url;
  final VoidCallback onPressed;

  const GalleryThumbnail({Key? key, required this.url, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? _child;

    if (["png", 'jpg'].contains(url.split(".").last)) {
      _child = SizedBox.expand(
          child: ImageLoader(
        url: url,
        boxFit: BoxFit.cover,
      ));
    } else {
      String? _youTubeId = YoutubePlayer.convertUrlToId(url);
      Uri _uri = Uri.parse(url);
      if (_uri.host == "www.soundcloud.com" || _uri.host == "soundcloud.com") {
        _child = Container(
          color: Colors.orange,
          child: const Center(
              child: FaIcon(
            FontAwesomeIcons.soundcloud,
            color: Colors.white,
          )),
        );
      } else if (_youTubeId != null) {
        _child = Stack(
          fit: StackFit.expand,
          children: [
            ImageLoader(
              url: "https://img.youtube.com/vi/$_youTubeId/0.jpg",
              boxFit: BoxFit.cover,
            ),
            const Center(
                child: FaIcon(
              FontAwesomeIcons.youtube,
              color: Colors.red,
            )),
          ],
        );
      }
    }
    return MaterialButton(
      padding: EdgeInsets.all(4.0 * AppResponsive.scaleFactor),
      onPressed: onPressed,
      child: _child ??
          Container(
            color: Colors.grey,
            child: const Center(
                child: FaIcon(
              FontAwesomeIcons.paperclip,
              color: Colors.white,
            )),
          ),
    );
  }
}
