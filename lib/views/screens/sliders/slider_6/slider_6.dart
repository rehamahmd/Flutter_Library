import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_6/slider_6_list.dart';
import 'package:flutter_app/views/ui_dummy_data/sliders_data.dart';

class SliderSixProps {
  final List<String> imagesList;
  SliderSixProps({this.imagesList = const []});
}

class SliderSix extends StatefulWidget {
  final SliderSixProps props;
  const SliderSix({Key? key, required this.props}) : super(key: key);

  @override
  State<SliderSix> createState() => _SliderSixState();
}

class _SliderSixState extends State<SliderSix> {
  List<SliderModel> sliders = [];
  @override
  void initState() {
    super.initState();

    sliders = SlidersData.generateRandomSlidersList(8, widget.props.imagesList);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SliderSixList(sliders: sliders));
  }
}
