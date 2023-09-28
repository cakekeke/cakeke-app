import 'package:cakeke/blocs/sign_up/sign_up_bloc.dart';
import 'package:cakeke/blocs/sign_up/sign_up_event.dart';
import 'package:cakeke/view/widgets/common/sign_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    this.isPasswordCheck = false,
    this.enabled = true,
  });

  final bool isPasswordCheck;
  final bool enabled;

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
                  if (isPasswordCheck) {
                    context.read<SignUpBloc>().add(RePasswordChangedEvent(
                          index: index,
                          rePassword: text,
                        ));
                  } else {
                    context.read<SignUpBloc>().add(PasswordChangedEvent(
                          index: index,
                          password: text,
                        ));
                  }
                },
                autoFocus: index == 0,
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
