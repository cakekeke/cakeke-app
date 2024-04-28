import 'package:cakeke/view/widgets/common/sign_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    this.enabled = true,
    this.autoFocus = false,
    required this.onChanged,
    required this.controllerList,
  });

  final bool enabled;
  final bool autoFocus;
  final Function(String, int) onChanged;
  final List<TextEditingController> controllerList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < controllerList.length; index++)
          Flexible(
            child: RawKeyboardListener(
              focusNode: FocusNode(),
              onKey: (event) {
                handleKey(context, event, index);
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SignTextField(
                  controller: controllerList[index],
                  enabled: enabled,
                  onChanged: (_) {},
                  autoFocus: autoFocus && index == 0,
                  inputType: TextInputType.number,
                  maxLength: 1,
                  isPassword: true,
                  hintText: '●',
                  isLast: index == controllerList.length - 1,
                ),
              ),
            ),
          ),
      ],
    );
  }

  void handleKey(BuildContext context, RawKeyEvent event, int index) {
    if (event is RawKeyDownEvent) {
      final isDelete = event.physicalKey == PhysicalKeyboardKey.backspace;
      controllerList[index].text = isDelete ? '' : event.data.keyLabel;
      onChanged(controllerList[index].text, index);
    }

    if (event.physicalKey == PhysicalKeyboardKey.backspace) {
      if (index != 0 && controllerList[index].text.isEmpty) {
        FocusScope.of(context).previousFocus();
      }
    } else if (controllerList[index].text.isNotEmpty) {
      if (index != controllerList.length - 1) {
        FocusScope.of(context).nextFocus();
      } else {
        FocusScope.of(context).unfocus();
      }
    }
  }
}
