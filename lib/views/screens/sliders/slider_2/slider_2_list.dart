import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_2/slider_2_list_item.dart';

class SliderTwoList extends StatefulWidget {
  final List<SliderModel> sliders;
  const SliderTwoList({Key? key, required this.sliders}) : super(key: key);

  @override
  _SliderTwoListState createState() => _SliderTwoListState();
}

class _SliderTwoListState extends State<SliderTwoList> {
  late PageController _controller;
  late ValueNotifier<double> _scrollIndex;

  void _listener() {
    _scrollIndex.value = _controller.page!;
  }

  @override
  void initState() {
    super.initState();

    int index = 0; //widget.items.length * 1000 - 2;
    _controller = PageController(
      initialPage: index,
      viewportFraction: .25,
    );
    _scrollIndex = ValueNotifier(index.toDouble());
    _controller.addListener(_listener);
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
        return Center(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: widget.sliders.length,
            itemBuilder: (context, itemIndex) {
              SliderModel item = widget.sliders[itemIndex];
              double factor = (itemIndex - _scrollIndex.value).clamp(-2.0, 2.0);
              return SliderTwoListItem(
                slider: item,
                factor: factor,
              );
            },
          ),
        );
      },
    );
  }
}
