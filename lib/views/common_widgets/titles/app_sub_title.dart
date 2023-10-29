import 'package:flutter/material.dart';
class AppSubTitle extends StatelessWidget {
  final String text;
  final Color? color;
  const AppSubTitle(this.text,{Key? key,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color
      ),
    );
  }
}
