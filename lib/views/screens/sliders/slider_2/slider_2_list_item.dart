import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/loaders/image_loader.dart';
import 'package:flutter_app/views/styles/styles.dart';

class SliderTwoListItem extends StatelessWidget {
  final SliderModel slider;
  final double factor;

  const SliderTwoListItem({Key? key, required this.slider, required this.factor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scale = ((factor + 2) / 3).clamp(.1, 1.0);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32 * AppResponsive.scaleFactor),
      child: Transform(
        alignment: Alignment.centerLeft,
        transform: Matrix4.identity()
          // ..setEntry(3, 2, .002)
          ..translate(
            factor.isNegative
                ? (factor) * -48 * AppResponsive.scaleFactor
                : (factor) * 180 * AppResponsive.scaleFactor,
            //factor*12*AppStyle.scaleFactor,
          )
          ..scale(factor < -1.0
              ? lerpDouble(.8, .6, factor.abs() - 1)
              : (1 - factor.abs()).clamp(factor.isNegative ? .8 : .9, 1.2)),
        child: Opacity(
          opacity: (2 - factor.abs()).clamp(0.0, 1.0),
          child: OverflowBox(
            minWidth: AppResponsive.size.width / 1.4,
            maxWidth: AppResponsive.size.width / 1.4,
            minHeight: AppResponsive.size.height / 1.8,
            maxHeight: AppResponsive.size.height / 1.8,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16 * AppResponsive.scaleFactor),
                  )),
              onPressed: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16 * AppResponsive.scaleFactor),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ImageLoader(
                      url: slider.image,
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
                      child: Text(
                        slider.title,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
