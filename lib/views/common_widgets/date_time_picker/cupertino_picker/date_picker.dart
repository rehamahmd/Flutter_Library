import 'package:flutter/cupertino.dart';
import 'package:flutter_app/views/styles/src/app_responsive.dart';

class CupertinoDatePickerWidget extends StatelessWidget {
  const CupertinoDatePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140 * AppResponsive.scaleFactor,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (dateTime) {},
      ),
    );
  }
}
