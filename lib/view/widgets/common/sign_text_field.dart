import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class SignTextField extends StatelessWidget {
  const SignTextField({
    super.key,
    required this.onChanged,
    this.controller,
    this.hintText,
    this.inputType,
    this.maxLength,
    this.enabled = true,
    this.autoFocus = false,
    this.isPassword = false,
    this.isLast = false,
  });

  final Function(String) onChanged;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? hintText;
  final int? maxLength;
  final bool enabled;
  final bool autoFocus;
  final bool isPassword;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return TextField(
        enabled: enabled,
        controller: controller,
        autofocus: autoFocus,
        obscureText: isPassword,
        maxLength: maxLength,
        keyboardType: inputType,
        textAlign: isPassword ? TextAlign.center : TextAlign.start,
        style: DesignSystem.typography.heading3(),
        obscuringCharacter: '●',
        decoration: InputDecoration(
          isDense: true,
          counterText: '',
          hintText: hintText,
          hintStyle: DesignSystem.typography.heading3(TextStyle(
              color: DesignSystem.colors.textDisabled,
              fontWeight: FontWeight.w700)),
          enabledBorder: UnderlineInputBorder(
            borderSide: isPassword
                ? BorderSide(width: 2, color: DesignSystem.colors.appPrimary)
                : BorderSide(color: DesignSystem.colors.divider),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: DesignSystem.colors.appPrimary),
          ),
        ),
        onChanged: (text) {
          onChanged(text);
        });
  }
}
