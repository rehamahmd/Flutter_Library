import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_7/slider_7_list_item.dart';
import 'package:flutter_app/views/styles/src/app_responsive.dart';
import 'package:flutter_app/views/ui_dummy_data/sliders_data.dart';

import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class SliderSeven extends StatefulWidget {
  const SliderSeven({Key? key}) : super(key: key);

  @override
  State<SliderSeven> createState() => _SliderSevenState();
}

class _SliderSevenState extends State<SliderSeven> {
  List<SliderModel> sliders = [];
  int showingItem = 1;
  @override
  void initState() {
    super.initState();
    sliders = SlidersData.generateRandomSlidersList(9, []);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> slidersWidget = sliders
        .map((slider) => Container(
              margin: const EdgeInsets.all(10),
              child: SliderSevenListItem(
                sliderModel: slider,
                cardWidth: AppResponsive.size.width,
                cardHeight: AppResponsive.getSize(260),
              ),
            ))
        .toList();
    return Center(
      child: StackedCardCarousel(
        items: slidersWidget,
        spaceBetweenItems: AppResponsive.getSize(250),
        pageController: PageController(initialPage: 0),
      ),
    );
  }
}
