import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/loaders/lazy_loading.dart';
import 'package:flutter_app/views/common_widgets/loaders/no_item_found.dart';
import 'package:flutter_app/views/screens/timeline/time_line_item.dart';

class TimeLineList extends StatelessWidget {
  final List<Topic> topics;
  final bool nextPage;
  final Future<void> Function() onLazyLoad;

  const TimeLineList(
      {Key? key, required this.topics, required this.nextPage, required this.onLazyLoad})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// if no item found show no item found view
    /// else display our list
    if (topics.isEmpty) {
      return NoItemFound(
        message: "No topics found",
      );
    }

    return LazyLoading(
      nextPage: nextPage,
      onLazyLoad: onLazyLoad,
      child: Scrollbar(
        child: ListView.builder(
            itemCount: topics.length,
            padding: EdgeInsets.symmetric(
                //horizontal: 16,
                vertical: 8),
            itemBuilder: (context, itemIndex) {
              Topic _topic = topics[itemIndex];
              return TimeLineItem(
                index: itemIndex,
                topic: _topic,
              );
            }),
      ),
    );
  }
}
