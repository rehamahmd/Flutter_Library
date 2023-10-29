import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_3/slider_3_list.dart';
import 'package:flutter_app/views/ui_dummy_data/sliders_data.dart';

class SliderThreeProps {
  final List<String> imagesList;
  SliderThreeProps({this.imagesList = const []});
}

class SliderThree extends StatefulWidget {
  final SliderThreeProps props;
  const SliderThree({Key? key, required this.props}) : super(key: key);

  @override
  State<SliderThree> createState() => _SliderThreeState();
}

class _SliderThreeState extends State<SliderThree> {
  List<SliderModel> sliders = [];
  @override
  void initState() {
    super.initState();

    sliders = SlidersData.generateRandomSlidersList(8, widget.props.imagesList);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SliderThreeList(sliders: sliders));
  }
}
