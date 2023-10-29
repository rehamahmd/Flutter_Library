import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/turntable/image_view_360.dart';

class TurnTableScreen extends StatelessWidget {
  const TurnTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ImageView360(
            autoRotate: true,
            rotationCount: 2,
            swipeSensitivity: 2,
            key: UniqueKey(),
            imageList: List.generate(28, (index) {
              return CachedNetworkImageProvider(
                  "https://polarnotion.github.io/turntable/images/planter/plant${28 - index}.JPG");
            }),
          ),
        ),
      ),
    );
  }
}
