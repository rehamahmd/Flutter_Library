import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/web_view/in_app_webview_widget.dart';

class GigaPixelScreen extends StatelessWidget {
  const GigaPixelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppWebView(
        uri: Uri.tryParse("http://www.gigapan.com/embeds/-B5SyNX6Ys4/"),
      ),
    );
  }
}
