import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_2/slider_2_list.dart';
import 'package:flutter_app/views/ui_dummy_data/sliders_data.dart';

class SliderTwoProps {
  final List<String> imagesList;
  SliderTwoProps({this.imagesList = const []});
}

class SliderTwo extends StatefulWidget {
  final SliderTwoProps props;
  const SliderTwo({Key? key, required this.props}) : super(key: key);

  @override
  State<SliderTwo> createState() => _SliderTwoState();
}

class _SliderTwoState extends State<SliderTwo> {
  List<SliderModel> sliders = [];
  @override
  void initState() {
    super.initState();

    sliders = SlidersData.generateRandomSlidersList(8, widget.props.imagesList);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SliderTwoList(sliders: sliders));
  }
}
