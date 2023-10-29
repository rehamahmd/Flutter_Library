import 'package:flutter/material.dart';
import 'package:flutter_app/views/styles/styles.dart';

class APageLoading extends StatelessWidget {
  const APageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppResponsive.size.width / 1.2,
        height: AppResponsive.size.height / 24,
        child: const LinearProgressIndicator(),
      ),
    );
  }
}
