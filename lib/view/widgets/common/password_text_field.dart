import 'package:cakeke/view/widgets/common/sign_text_field.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
      {super.key,
      this.enabled = true,
      this.autoFocus = false,
      required this.onChanged});

  final bool enabled;
  final bool autoFocus;
  final Function(String, int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < 6; index++)
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SignTextField(
                enabled: enabled,
                onChanged: (text) {
                  onChanged(text, index);
                },
                autoFocus: autoFocus && index == 0,
                inputType: TextInputType.number,
                maxLength: 1,
                isPassword: true,
                hintText: '●',
                isLast: index == 5,
              ),
            ),
          ),
      ],
    );
  }
}
