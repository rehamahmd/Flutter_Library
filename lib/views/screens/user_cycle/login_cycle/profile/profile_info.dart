import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/titles/app_body.dart';
import 'package:flutter_app/views/common_widgets/titles/app_sub_title.dart';
import 'package:flutter_app/views/styles/src/app_responsive.dart';

class ProfileInfo extends StatelessWidget {
  final bool editing;
  final String label;
  final String? value;
  final Widget field;

  const ProfileInfo(
      {Key? key,
      required this.label,
      required this.value,
      required this.field,
      required this.editing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 600),
      switchInCurve: Curves.easeInOutBack,
      switchOutCurve: Curves.easeInOutBack,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: editing
          ? field
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16 * AppResponsive.scaleFactor),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSubTitle(label),
                      AppBody(value ?? "no data found"),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
