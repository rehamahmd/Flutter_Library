import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_1/slider_1_list_item.dart';
import 'package:flutter_app/views/styles/styles.dart';

class SliderOneList extends StatelessWidget {
  final int showingItem;
  final List<SliderModel> sliders;
  const SliderOneList({Key? key, required this.showingItem, required this.sliders})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardHeight = 500 / (showingItem + 1);
    double cardWidth = (AppResponsive.size.width - 60);
    cardWidth = cardWidth / showingItem;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: AppResponsive.getSize(cardHeight),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const RangeMaintainingScrollPhysics(),
          itemCount: sliders.length,
          itemBuilder: (context, index) {
            return SliderOneListItem(
              cardWidth: cardWidth,
              sliderModel: sliders[index],
            );
          },
        ),
      ),
    );
  }
}
