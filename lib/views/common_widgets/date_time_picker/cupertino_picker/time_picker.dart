import 'package:flutter/cupertino.dart';
import 'package:flutter_app/views/styles/src/app_responsive.dart';

class CupertinoTimePickerWidget extends StatelessWidget {
  const CupertinoTimePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140 * AppResponsive.scaleFactor,
      child: CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.hms,
        onTimerDurationChanged: (value) {},
      ),
    );
  }
}
