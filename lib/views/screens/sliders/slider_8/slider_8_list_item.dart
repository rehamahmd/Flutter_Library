import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/loaders/image_loader.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:intl/intl.dart';

class SliderEightListItem extends StatelessWidget {
  final SliderModel item;
  final double factor;

  const SliderEightListItem({Key? key, required this.item, required this.factor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        //..setEntry(3, 2, .002)
        ..translate(
          0.0,
          factor.abs() * 32 * AppResponsive.scaleFactor,
        ),
      child: TextButton(
        onPressed: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16 * AppResponsive.scaleFactor),
          child: Stack(
            //alignment: Alignment.center,
            //fit: StackFit.loose,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Opacity(
                    opacity: 1 - factor.abs(),
                    child: Center(
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          //..setEntry(3, 2, .002)
                          ..translate(factor > 0 ? factor * AppResponsive.size.width / 2.5 : 0.0)
                          ..scale(
                            factor > 0 ? 1.0 : (1 - factor.abs()).clamp(.9, 1.0),
                            factor > 0 ? 1.0 : 1 - factor.abs(),
                          ),
                        child: Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 84.0 * AppResponsive.scaleFactor),
                          padding: EdgeInsets.only(
                            top: 72.0 * AppResponsive.scaleFactor,
                            left: 8.0 * AppResponsive.scaleFactor,
                            right: 8.0 * AppResponsive.scaleFactor,
                            bottom: 8.0 * AppResponsive.scaleFactor,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16 * AppResponsive.scaleFactor),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item.title,
                              ),
                              Text(
                                item.description,
                                maxLines: 4,
                              ),
                              Center(child: Text(DateFormat.yMd().add_jm().format(DateTime.now()))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16 * AppResponsive.scaleFactor),
                      child: Opacity(
                        opacity: (1 - factor.abs()).clamp(.5, 1.0),
                        child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: ImageLoader(
                              url: item.image,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
