import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_button.dart';
import 'package:intl/intl.dart';

class MaterialDateAndTimePicker extends StatefulWidget {
  final DateTime? initialValue;
  final Function(DateTime) onPick;
  const MaterialDateAndTimePicker({Key? key, this.initialValue, required this.onPick})
      : super(key: key);

  @override
  _MaterialDateAndTimePickerState createState() => _MaterialDateAndTimePickerState();
}

class _MaterialDateAndTimePickerState extends State<MaterialDateAndTimePicker> {
  DateTime? _selectedDateTime;

  // handle pick date and time event
  _onPressed() async {
    DateTime _now = DateTime.now();
    DateTime? _dateTemp = await showDatePicker(
      firstDate: DateTime(1990),
      initialDate: _now,
      lastDate: DateTime(_now.year + 1),
      context: context,
    );

    if (_dateTemp == null) return;

    TimeOfDay? _timeTemp = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (_timeTemp != null) {
      _dateTemp.add(Duration(
        hours: _timeTemp.hour,
        minutes: _timeTemp.minute,
      ));
    }

    _selectedDateTime = _dateTemp;
    widget.onPick(_selectedDateTime!);
    setState(() {});
  }

  @override
  void initState() {
    _selectedDateTime = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: _selectedDateTime == null
          ? "Pick Date And Time"
          : DateFormat.yMd().add_jm().format(_selectedDateTime!),
      onPressed: _onPressed,
    );
  }
}
