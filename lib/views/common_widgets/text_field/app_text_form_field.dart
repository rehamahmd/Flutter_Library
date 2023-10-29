import 'dart:ui';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? label;
  final String? hint;
  final String? errorMessage;
  final String? initialValue;
  final TextAlign? textAlign;
  final double? width;
  final bool readOnly;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Function(String?)? onChange;
  final Function()? onTap; //
  final int? length;
  final TextInputAction? textInputAction;
  final VoidCallback? onAction;

  const AppTextFormField({
    Key? key,
    this.textInputType,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.textAlign,
    this.label,
    this.hint,
    this.errorMessage,
    this.readOnly = false,
    this.length,
    this.onSaved,
    this.validator,
    this.onChange,
    this.onTap,
    this.initialValue,
    this.textInputAction,
    this.onAction,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onSaved: onSaved,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChange,
      onTap: onTap,
      style: Theme.of(context).textTheme.bodyText1,
      validator: validator,
      keyboardType: textInputType,
      readOnly: readOnly,
      controller: controller,
      obscureText: obscureText,
      maxLength: length,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: textInputType == TextInputType.multiline ? null : 1,
      textInputAction:
          textInputType == TextInputType.multiline ? null : textInputAction ?? TextInputAction.next,
      onEditingComplete: onAction ?? () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        border: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        labelText: label,
        hintText: hint,
        fillColor: Theme.of(context).colorScheme.background,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorText: errorMessage,
      ),
    );
  }
}
