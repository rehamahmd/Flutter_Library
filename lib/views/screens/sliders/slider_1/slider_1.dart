import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_1/slider_1_list.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:flutter_app/views/ui_dummy_data/sliders_data.dart';

class SliderOneProps {
  final int itemNumbersShowInScreen;
  final List<String> imagesList;
  SliderOneProps({this.itemNumbersShowInScreen = 1, this.imagesList = const []})
      : assert(itemNumbersShowInScreen < 5 && 0 < itemNumbersShowInScreen);
}

class SliderOne extends StatefulWidget {
  final SliderOneProps props;
  const SliderOne({Key? key, required this.props}) : super(key: key);

  @override
  _SliderOneState createState() => _SliderOneState();
}

class _SliderOneState extends State<SliderOne> {
  List<SliderModel> sliders = [];

  @override
  void initState() {
    super.initState();

    sliders = SlidersData.generateRandomSlidersList(5, widget.props.imagesList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderOneList(
          showingItem: widget.props.itemNumbersShowInScreen,
          sliders: sliders,
        ),
      ],
    );
  }
}
