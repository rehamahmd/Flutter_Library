import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/loaders/image_loader.dart';
import 'package:flutter_app/views/router/router.dart';
import 'package:flutter_app/views/screens/sliders/slider_1/slider_1.dart';
import 'package:flutter_app/views/screens/sliders/slider_2/slider_2.dart';
import 'package:flutter_app/views/screens/sliders/slider_3/slider_3.dart';
import 'package:flutter_app/views/screens/sliders/slider_4/slider_4.dart';
import 'package:flutter_app/views/screens/sliders/slider_5/slider_5.dart';
import 'package:flutter_app/views/screens/sliders/slider_6/slider_6.dart';
import 'package:flutter_app/views/screens/sliders/slider_7/slider_7.dart';
import 'package:flutter_app/views/screens/sliders/slider_8/slider_8.dart';
import 'package:flutter_app/views/screens/sliders/slider_9/slider_9.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:go_router/go_router.dart';

class SlidersTab extends StatelessWidget {
  const SlidersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pages = [
      {'title': 'Slider 1', 'gif': AppIcons.slider_1, 'screen': slider1Screen},
      {'title': 'Slider 2', 'gif': AppIcons.slider_2, 'screen': slider2Screen},
      {'title': 'Slider 3', 'gif': AppIcons.slider_3, 'screen': slider3Screen},
      {'title': 'Slider 4', 'gif': AppIcons.slider_4, 'screen': slider4Screen},
      {'title': 'Slider 5', 'gif': AppIcons.slider_5, 'screen': slider5Screen},
      {'title': 'Slider 6', 'gif': AppIcons.slider_6, 'screen': slider6Screen},
      {'title': 'Slider 7', 'gif': AppIcons.slider_7, 'screen': slider7Screen},
      {'title': 'Slider 8', 'gif': AppIcons.slider_8, 'screen': slider8Screen},
      {'title': 'Slider 9', 'gif': AppIcons.slider_9, 'screen': slider9Screen},
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            ...pages.map(
              (page) => GestureDetector(
                onTap: () {
                  context.pushNamed(page['screen']);
                },
                child: Stack(
                  children: [
                    SizedBox(
                      width: (AppResponsive.size.width / 2),
                      height: 200,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageLoader(
                          url: page['gif'],
                          boxFit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 8.0,
                      right: 8.0,
                      child: Container(
                        height: 40,
                        color: AppColors.orange.withOpacity(.5),
                        child: Center(
                          child: Text(page['title']),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ].toList(),
        ),
      ),
    );
  }
}
