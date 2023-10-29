import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/common_widgets/loaders/image_loader.dart';

class ListItem extends StatelessWidget {
  final Topic topic;
  final Function(Topic)? onPressed;

  const ListItem({Key? key, required this.topic, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: onPressed == null,
      child: Container(
        height: 136,
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              primary: Theme.of(context).colorScheme.background,
              elevation: 2),
          onPressed: () {
            onPressed!(topic);
          },
          child: Row(
            children: [
              SizedBox(
                width: 120,
                child: ImageLoader(
                  url: topic.thumbnailUrl,
                  boxFit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  topic.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
