import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/sliders/slider_9/slider_9_list_item.dart';

class SliderNineList extends StatefulWidget {
  final List<SliderModel> items;

  const SliderNineList({Key? key, required this.items}) : super(key: key);

  @override
  _SliderNineListState createState() => _SliderNineListState();
}

class _SliderNineListState extends State<SliderNineList> {
  late PageController _controller;
  late ValueNotifier<double> _scrollIndex;

  void _listener() {
    _scrollIndex.value = _controller.page!;
  }

  @override
  void initState() {
    int index = widget.items.length - 2;
    _controller = PageController(
      initialPage: index,
      viewportFraction: .20,
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
          itemCount: widget.items.length + 2,
          itemBuilder: (context, itemIndex) {
            if (itemIndex < 2 || itemIndex > widget.items.length + 1) {
              return const SizedBox.shrink();
            }

            SliderModel item = widget.items[itemIndex - 2];
            double factor = (itemIndex - _scrollIndex.value).clamp(-3.0, 3.0);
            return SliderNineListItem(
              item: item,
              factor: factor,
            );
          },
        );
      },
    );
  }
}
