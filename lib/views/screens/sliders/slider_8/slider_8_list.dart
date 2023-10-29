import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_8/slider_8_list_item.dart';

class SliderEightList extends StatefulWidget {
  final List<SliderModel> items;

  const SliderEightList({Key? key, required this.items}) : super(key: key);

  @override
  _SliderEightListState createState() => _SliderEightListState();
}

class _SliderEightListState extends State<SliderEightList> {
  late PageController _controller;
  late ValueNotifier<double> _scrollIndex;

  void _listener() {
    _scrollIndex.value = _controller.page!;
  }

  @override
  void initState() {
    int index = 0;
    _controller = PageController(
      initialPage: index,
      viewportFraction: .80,
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
          scrollDirection: Axis.horizontal,
          controller: _controller,
          itemCount: widget.items.length,
          itemBuilder: (context, itemIndex) {
            SliderModel item = widget.items[itemIndex];
            double factor = (itemIndex - _scrollIndex.value).clamp(-1.0, 1.0);
            return SliderEightListItem(
              item: item,
              factor: factor,
            );
          },
        );
      },
    );
  }
}
