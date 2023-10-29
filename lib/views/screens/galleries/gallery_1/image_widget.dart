import 'package:flutter/material.dart';
import 'package:flutter_app/views/styles/src/app_responsive.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  const ImageWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: AppResponsive.size.width,
    );
  }
}
