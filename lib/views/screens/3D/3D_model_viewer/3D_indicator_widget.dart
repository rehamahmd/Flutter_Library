import 'package:flutter/material.dart';
import 'package:flutter_app/views/screens/3D/3D_model_viewer/custom_transition.dart';

import 'package:flutter_app/views/screens/3D/3D_model_viewer/measure_size.dart';

import 'package:flutter_app/views/styles/src/app_colors.dart';

const double topMargin = 100;
const double bottomMargin = 40;

class A3DIndicatorWidget extends StatelessWidget {
  final ScrollController scrollController;
  final int currentIndex;
  final double scrollPercentage;
  final double scrollTotalHeight;
  final Animation<double> scrollIndicatorAnimation;
  final Function onChange;

  const A3DIndicatorWidget({
    Key? key,
    required this.scrollController,
    required this.currentIndex,
    required this.scrollPercentage,
    required this.scrollTotalHeight,
    required this.scrollIndicatorAnimation,
    required this.onChange,
  }) : super(key: key);

  @override
  AnimatedBuilder build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (BuildContext? context, Widget? child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            MeasureSize(
              onChange: (size) => onChange(size),
              child: Container(
                width: 4,
                margin: const EdgeInsets.only(top: topMargin, bottom: bottomMargin),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05), borderRadius: BorderRadius.circular(2)),
              ),
            ),
            AnimatedContainer(
              curve: Curves.slowMiddle,
              width: 4,
              height: scrollPercentage * scrollTotalHeight,
              margin: const EdgeInsets.only(top: topMargin, bottom: 40),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.orange.withOpacity(0.1),
                      AppColors.orange,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(2)),
              duration: const Duration(milliseconds: 1200),
            ),
            AnimatedPositioned(
                top: scrollPercentage * scrollTotalHeight + topMargin - 10,
                right: -12,
                duration: const Duration(milliseconds: 1200),
                child: IndicatorAnimation(
                  animation: scrollIndicatorAnimation,
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5)
                        ]),
                    child: AnimatedSwitcher(
                      transitionBuilder: (child, animation) {
                        return Transition.container(driveAnimation: animation, child: child);
                      },
                      duration: const Duration(milliseconds: 400),
                      child: Text(
                        animalsEmojiMapper[currentIndex]!,
                        key: ValueKey(currentIndex),
                        style: const TextStyle(color: Colors.black54, fontSize: 10),
                      ),
                    ),
                  ),
                )),
          ],
        );
      },
    );
  }

  AnimatedBuilder indicator(ScrollController scrollController, int currentIndex, double sph,
      double sth, Animation<double> scrollIndicatorAnimation) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (BuildContext? context, Widget? child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            MeasureSize(
              onChange: (size) {
                // scrollTotalHeight = size.height - _topMargin - _bottomMargin;
                // setState(() {});
              },
              child: Container(
                width: 4,
                margin: const EdgeInsets.only(top: topMargin, bottom: bottomMargin),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05), borderRadius: BorderRadius.circular(2)),
              ),
            ),
            AnimatedContainer(
              curve: Curves.slowMiddle,
              width: 4,
              height: sph * sth,
              margin: const EdgeInsets.only(top: topMargin, bottom: 40),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.orange.withOpacity(0.1),
                      AppColors.orange,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(2)),
              duration: const Duration(milliseconds: 1200),
            ),
            AnimatedPositioned(
                top: sph * sth + topMargin - 10,
                right: -12,
                duration: const Duration(milliseconds: 1200),
                child: IndicatorAnimation(
                  animation: scrollIndicatorAnimation,
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5)
                        ]),
                    child: AnimatedSwitcher(
                      transitionBuilder: (child, animation) {
                        return Transition.container(driveAnimation: animation, child: child);
                      },
                      duration: const Duration(milliseconds: 400),
                      child: Text(
                        animalsEmojiMapper[currentIndex]!,
                        key: ValueKey(currentIndex),
                        style: const TextStyle(color: Colors.black54, fontSize: 10),
                      ),
                    ),
                  ),
                )),
          ],
        );
      },
    );
  }
}

Map<int, String> animalsEmojiMapper = {
  1: '🐼',
  2: '🦥',
  3: '😸',
  4: '🐢',
  5: '🐘',
  6: '🦊',
  7: '🐬',
  8: '🦌',
};
