import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/loaders/image_loader.dart';

class SliderThreeListItem extends StatelessWidget {
  final double cardWidth;
  final double? cardHeight;
  final double? borderRadius;
  final SliderModel sliderModel;
  const SliderThreeListItem({
    Key? key,
    required this.cardWidth,
    required this.sliderModel,
    this.cardHeight,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      width: cardWidth,
      height: cardHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? 10.0),
        ),
        child: ImageLoader(
          url: sliderModel.image,
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }
}
