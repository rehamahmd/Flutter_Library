import 'package:flutter/cupertino.dart';
import 'package:flutter_app/views/styles/styles.dart';

class CupertinoDateAndTimePickerWidget extends StatelessWidget {
  const CupertinoDateAndTimePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140 * AppResponsive.scaleFactor,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.dateAndTime,
        onDateTimeChanged: (dateTime) {},
      ),
    );
  }
}
