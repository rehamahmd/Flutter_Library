import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_8/slider_8_list.dart';

import 'package:flutter_app/views/ui_dummy_data/sliders_data.dart';

class SliderEightProps {
  final List<String> imagesList;
  SliderEightProps({this.imagesList = const []});
}

class SliderEight extends StatefulWidget {
  final SliderEightProps props;
  const SliderEight({Key? key, required this.props}) : super(key: key);

  @override
  State<SliderEight> createState() => _SliderEightState();
}

class _SliderEightState extends State<SliderEight> {
  List<SliderModel> sliders = [];
  @override
  void initState() {
    super.initState();

    sliders = SlidersData.generateRandomSlidersList(8, widget.props.imagesList);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SliderEightList(items: sliders));
  }
}
