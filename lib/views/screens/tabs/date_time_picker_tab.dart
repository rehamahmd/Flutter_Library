import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/date_time_picker/cupertino_picker/date_and_time_picker.dart';
import 'package:flutter_app/views/common_widgets/date_time_picker/cupertino_picker/date_picker.dart';
import 'package:flutter_app/views/common_widgets/date_time_picker/cupertino_picker/time_picker.dart';
import 'package:flutter_app/views/common_widgets/date_time_picker/material_picker/date_and_time_picker.dart';
import 'package:flutter_app/views/common_widgets/date_time_picker/material_picker/date_picker.dart';
import 'package:flutter_app/views/common_widgets/date_time_picker/material_picker/time_picker.dart';
import 'package:flutter_app/views/common_widgets/titles/app_sub_title.dart';
import 'package:flutter_app/views/styles/src/app_responsive.dart';

class DateAndTimePickerTab extends StatelessWidget {
  const DateAndTimePickerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16 * AppResponsive.scaleFactor),
        children: [
          const AppSubTitle("Material Picker"),
          SizedBox(height: 8 * AppResponsive.scaleFactor),
          MaterialDateAndTimePicker(onPick: (dateTime) {}),
          SizedBox(height: 8 * AppResponsive.scaleFactor),
          Row(
            children: [
              Expanded(child: MaterialDatePicker(onPick: (dateTime) {})),
              SizedBox(width: 8 * AppResponsive.scaleFactor),
              Expanded(child: MaterialTimePicker(onPick: (time) {}))
            ],
          ),
          SizedBox(height: 20 * AppResponsive.scaleFactor),
          const AppSubTitle("Cupertino Picker"),
          SizedBox(height: 8 * AppResponsive.scaleFactor),
          const CupertinoDateAndTimePickerWidget(),
          SizedBox(height: 8 * AppResponsive.scaleFactor),
          const CupertinoDatePickerWidget(),
          SizedBox(height: 8 * AppResponsive.scaleFactor),
          const CupertinoTimePickerWidget(),
        ],
      ),
    );
  }
}
