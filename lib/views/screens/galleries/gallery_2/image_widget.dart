import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/loaders/image_loader.dart';

class ImageWidget extends StatelessWidget {
  final String url;

  const ImageWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => Scaffold(
            body: InteractiveViewer(
              child: Center(child: ImageLoader(url: url)),
            ),
          ),
        ));
      },
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ImageLoader(
          url: url,
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }
}
