import 'package:flutter/material.dart';
class AppBody extends StatelessWidget {
  final String text;
  final Color? color;
  final int? maxLines;
  const AppBody(this.text,{Key? key,this.color, this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
        fontSize: 14,
        color: color
      ),
    );
  }
}
