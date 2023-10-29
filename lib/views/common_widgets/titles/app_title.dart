import 'package:flutter/material.dart';
class AppTitle extends StatelessWidget {
  final String text;
  final Color? color;
  const AppTitle(this.text,{Key? key,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4?.copyWith(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: color ?? Theme.of(context).colorScheme.primary
      ),
    );
  }
}
