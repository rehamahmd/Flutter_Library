import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_6/slider_6_list_item.dart';

class SliderSixList extends StatefulWidget {
  final List<SliderModel> sliders;

  const SliderSixList({Key? key, required this.sliders}) : super(key: key);

  @override
  _SliderSixListState createState() => _SliderSixListState();
}

class _SliderSixListState extends State<SliderSixList> {
  late PageController _controller;
  late ValueNotifier<double> _scrollIndex;

  void _listener() {
    _scrollIndex.value = _controller.page!;
  }

  @override
  void initState() {
    int index = widget.sliders.length * 1000 - 2;
    _controller = PageController(
      initialPage: index,
      viewportFraction: .14,
    );
    _scrollIndex = ValueNotifier(index.toDouble());
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: _scrollIndex,
      builder: (context, value, _) {
        return PageView.builder(
          scrollDirection: Axis.vertical,
          controller: _controller,
          //itemCount: widget.items.length,
          itemBuilder: (context, itemIndex) {
            SliderModel item = widget.sliders[itemIndex % widget.sliders.length];
            double factor = (itemIndex - _scrollIndex.value).clamp(-4.0, 4.0);
            return SliderSixListItem(
              item: item,
              factor: factor,
            );
          },
        );
      },
    );
  }
}
