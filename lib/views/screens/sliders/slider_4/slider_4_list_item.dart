import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/loaders/image_loader.dart';
import 'package:flutter_app/views/styles/styles.dart';

class SliderFourListItem extends StatelessWidget {
  final SliderModel item;

  const SliderFourListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16 * AppResponsive.scaleFactor),
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
            child: Text(item.title),
          ),
        ],
      ),
    );
  }
}
