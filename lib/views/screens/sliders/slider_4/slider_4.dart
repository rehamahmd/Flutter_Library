import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_4/slider_4_list.dart';
import 'package:flutter_app/views/screens/sliders/slider_4/slider_4_list_item.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:flutter_app/views/ui_dummy_data/sliders_data.dart';

class SliderFourProps {
  final List<String> imagesList;
  final double height;
  SliderFourProps({this.imagesList = const [], this.height = 220});
}

class SliderFour extends StatefulWidget {
  final SliderFourProps props;
  const SliderFour({Key? key, required this.props}) : super(key: key);

  @override
  State<SliderFour> createState() => _SliderFourState();
}

class _SliderFourState extends State<SliderFour> {
  List<SliderModel> sliders = [];
  @override
  void initState() {
    super.initState();

    sliders = SlidersData.generateRandomSlidersList(8, widget.props.imagesList);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: widget.props.height,
        child: SliderFourList(
          itemExtent: AppResponsive.size.width / 1.4,
          initialIndex: 0,
          enableBackItemsShadow: false,
          backItemsShadowColor: Theme.of(context).shadowColor,
          padding: const EdgeInsets.all(12),
          children: List.generate(sliders.length, (index) {
            final item = sliders[index];
            return SliderFourListItem(item: item);
          }),
        ),
      ),
    );
  }
}
