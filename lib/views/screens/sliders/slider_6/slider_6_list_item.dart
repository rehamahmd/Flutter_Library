import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/loaders/image_loader.dart';
import 'package:flutter_app/views/styles/styles.dart';

class SliderSixListItem extends StatelessWidget {
  final SliderModel item;
  final double factor;

  const SliderSixListItem({Key? key, required this.item, required this.factor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.bottomCenter,
      transform: Matrix4.identity()
        // ..setEntry(3, 2, .002)
        ..translate(0.0, factor * 22 * AppResponsive.scaleFactor)
        ..scale(((8 + factor) / 10) //.clamp(.1, 1.0)
            ),
      child: Opacity(
        opacity: (3 - factor.abs()).clamp(0.0, 1.0),
        child: OverflowBox(
          minHeight: AppResponsive.size.height / 3,
          maxHeight: AppResponsive.size.height / 3,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16 * AppResponsive.scaleFactor),
              topRight: Radius.circular(16 * AppResponsive.scaleFactor),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImageLoader(
                  url: item.image,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(32 * AppResponsive.scaleFactor),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Theme.of(context).colorScheme.primary.withOpacity(.3),
                        Colors.transparent,
                      ])),
                  // child: Text(item.title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
