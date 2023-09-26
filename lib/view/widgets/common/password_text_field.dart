import 'package:cakeke/view/widgets/common/sign_text_field.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, required this.contorllerList});

  final List<TextEditingController> contorllerList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < contorllerList.length; index++)
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SignTextField(
                textController: contorllerList[index],
                autoFocus: index == 0,
                inputType: TextInputType.number,
                isPassword: true,
                hintText: '●',
                isLast: index == contorllerList.length - 1,
              ),
            ),
          ),
      ],
    );
  }
}
