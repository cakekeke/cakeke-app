import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        inputFormatters: this.isPassword
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6)
              ]
            : null,
        enabled: enabled,
        controller: controller,
        autofocus: autoFocus,
        obscureText: isPassword,
        maxLength: maxLength,
        keyboardType: inputType,
        textAlign: TextAlign.start,
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
            borderSide: BorderSide(color: DesignSystem.colors.divider),
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
