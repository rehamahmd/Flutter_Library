import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/web_view/in_app_web_view_widget.dart';

class YoutubeWidget extends StatelessWidget {
  final String id;
  const YoutubeWidget({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InAppWebViewWidget(
      uri: Uri.tryParse("https://www.youtube.com/embed/$id"),
    );
  }
}
