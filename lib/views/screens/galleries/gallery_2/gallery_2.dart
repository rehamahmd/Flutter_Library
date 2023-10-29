import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/galleries/gallery_2/gallery_in_row.dart';
import 'package:flutter_app/views/styles/src/app_responsive.dart';

class GalleryTwo extends StatelessWidget {
  final List<String> urls;
  final double viewFraction;
  final int initialIndex;
  final bool infinityScroll;
  final double height;
  final double aspectRatio;

  const GalleryTwo({
    Key? key,
    required this.urls,
    this.viewFraction = 1.0,
    this.initialIndex = 0,
    this.height = 220,
    this.infinityScroll = false,
    this.aspectRatio = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CarouselSlider.builder(
        itemCount: urls.length,
        itemBuilder: (context, index, _) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4 * AppResponsive.scaleFactor),
            child: GalleryInRow(url: urls[index]),
          );
        },
        options: CarouselOptions(
          initialPage: initialIndex,
          enableInfiniteScroll: infinityScroll,
          viewportFraction: viewFraction,
        ),
      ),
    );
  }
}
