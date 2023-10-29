import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates list of video players
class YoutubeVideo extends StatefulWidget {
  final String initialKey;
  YoutubeVideo({required this.initialKey});
  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.initialKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        isLive: true,
        controlsVisibleAtStart: true,
        disableDragSeek: true,
      ),
    );

    return YoutubePlayer(
      key: ObjectKey(_controller),
      controller: _controller,
      actionsPadding: const EdgeInsets.only(left: 40.0),
    );
  }
}
