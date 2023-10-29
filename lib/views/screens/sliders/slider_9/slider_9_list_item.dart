import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/loaders/image_loader.dart';
import 'package:flutter_app/views/styles/styles.dart';

class SliderNineListItem extends StatelessWidget {
  final SliderModel item;
  final double factor;

  const SliderNineListItem({Key? key, required this.item, required this.factor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, .002)
        ..rotateX(factor.clamp(-1.0, 1.0) / 5)
        ..translate(
          factor.abs() < 2.0 ? 0.0 : -(factor - 2).clamp(0.0, 1.0) * AppResponsive.size.width,
          factor.isNegative
              ? factor * factor * 28 * AppResponsive.scaleFactor
              : -factor * factor * 12 * AppResponsive.scaleFactor,
        )
        ..scale(factor > 2.0 ? 4 / (factor * factor) : (8 + factor) / 10),
      child: OverflowBox(
        minHeight: AppResponsive.size.height / 4,
        maxHeight: AppResponsive.size.height / 4,
        minWidth: AppResponsive.size.width / 1.2,
        maxWidth: AppResponsive.size.width / 1.2,
        child: TextButton(
          onPressed: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16 * AppResponsive.scaleFactor),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImageLoader(url: item.image),
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
                  child: Text(item.title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
