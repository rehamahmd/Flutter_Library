import 'package:flutter/material.dart';
import 'package:flutter_app/views/styles/styles.dart';

class AppButton extends StatelessWidget {
  final Color? color;
  final String? text;
  final VoidCallback? onPressed;

  const AppButton({Key? key, this.color, this.text, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color? _textColor = color == null
        ? null
        : (color?.computeLuminance() ?? 0.0) > 0.4
            ? Colors.black
            : Colors.white;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: 16 * AppResponsive.scaleFactor,
            horizontal: 16 * AppResponsive.scaleFactor,
          ),
          primary: color,
          onPrimary: _textColor,
          shape: const BeveledRectangleBorder(),
        ),
        child: Text(
          text ?? "Missing Text",
        ),
        onPressed: onPressed);
  }
}
