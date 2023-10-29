import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_button.dart';

class MaterialTimePicker extends StatefulWidget {
  final TimeOfDay? initialValue;
  final Function(TimeOfDay) onPick;
  const MaterialTimePicker({Key? key, this.initialValue, required this.onPick}) : super(key: key);

  @override
  _MaterialTimePickerState createState() => _MaterialTimePickerState();
}

class _MaterialTimePickerState extends State<MaterialTimePicker> {
  TimeOfDay? _selectedDateTime;

  // handle pick time event
  _onPressed() async {
    TimeOfDay? _temp = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
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
      text: _selectedDateTime == null ? "Pick Time" : _selectedDateTime!.format(context),
      onPressed: _onPressed,
    );
  }
}
