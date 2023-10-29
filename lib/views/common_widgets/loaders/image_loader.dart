import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String url;
  final BoxFit? boxFit;
  final Color? color;
  final Alignment? alignment;
  final double failedIconSize;
  const ImageLoader(
      {Key? key,
      required this.url,
      this.boxFit,
      this.color,
      this.alignment,
      this.failedIconSize = 32})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image;
    image = CachedNetworkImage(
      imageUrl: url,
      fit: boxFit ?? BoxFit.cover,
      alignment: Alignment.center,
      placeholder: (context, url) => const Center(
        child: SizedBox(height: 18, width: 18, child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) {
        return Center(
            child: Icon(
          Icons.broken_image_rounded,
          size: failedIconSize,
        ));
      },
    );
    if (color == null) {
      return image;
    }
    return ColorFiltered(
      colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
      child: image,
    );
  }
}
