import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/loaders/shimmer_loading.dart';
import 'package:flutter_app/views/styles/src/app_responsive.dart';

class ImageShimmerLoader extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final BoxFit? boxFit;
  final Color? color;
  final Alignment? alignment;
  final double failedIconSize;
  const ImageShimmerLoader({
    Key? key,
    required this.url,
    required this.height,
    required this.width,
    this.boxFit,
    this.color,
    this.alignment,
    this.failedIconSize = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image;
    image = CachedNetworkImage(
      imageUrl: url,
      fit: boxFit ?? BoxFit.cover,
      alignment: Alignment.center,
      placeholder: (context, url) => Center(
        child: ShimmerWidget.rectangular(height: height, width: width),
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
