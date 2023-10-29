import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_button.dart';
import 'package:intl/intl.dart';

class MaterialDatePicker extends StatefulWidget {
  final DateTime? initialValue;
  final Function(DateTime) onPick;
  const MaterialDatePicker({Key? key, this.initialValue, required this.onPick}) : super(key: key);

  @override
  _MaterialDatePickerState createState() => _MaterialDatePickerState();
}

class _MaterialDatePickerState extends State<MaterialDatePicker> {
  DateTime? _selectedDateTime;

  // handle pick date event
  _onPressed() async {
    DateTime _now = DateTime.now();
    DateTime? _temp = await showDatePicker(
      firstDate: DateTime(1990),
      initialDate: _now,
      lastDate: DateTime(_now.year + 1),
      context: context,
    );
    if (_temp != null) {
      _selectedDateTime = _temp;
      widget.onPick(_selectedDateTime!);
      setState(() {});
    }
  }

  @override
  void initState() {
    _selectedDateTime = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: _selectedDateTime == null ? "Pick Date" : DateFormat.yMd().format(_selectedDateTime!),
      onPressed: _onPressed,
    );
  }
}
