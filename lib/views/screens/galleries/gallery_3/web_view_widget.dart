import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewWidget extends StatelessWidget {
  final Uri? uri;
  final String? data;
  const WebViewWidget({Key? key, this.uri, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: uri == null ? null : URLRequest(url: uri),
      initialData: data == null
          ? null
          : InAppWebViewInitialData(
              data: data!,
            ),
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        return NavigationActionPolicy.CANCEL;
      },
      initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(useShouldOverrideUrlLoading: true)),
      onEnterFullscreen: (controller) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      },
      onExitFullscreen: (controller) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      },
    );
  }
}
