import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_9/slider_9_list.dart';
import 'package:flutter_app/views/ui_dummy_data/sliders_data.dart';

class SliderNineProps {
  final List<String> imagesList;
  SliderNineProps({this.imagesList = const []});
}

class SliderNine extends StatefulWidget {
  final SliderNineProps props;
  const SliderNine({Key? key, required this.props}) : super(key: key);

  @override
  State<SliderNine> createState() => _SliderNineState();
}

class _SliderNineState extends State<SliderNine> {
  List<SliderModel> sliders = [];
  @override
  void initState() {
    super.initState();

    sliders = SlidersData.generateRandomSlidersList(8, widget.props.imagesList);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SliderNineList(items: sliders));
  }
}
