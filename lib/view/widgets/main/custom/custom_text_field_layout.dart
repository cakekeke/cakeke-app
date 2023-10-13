import 'package:cakeke/blocs/custom/custom_bloc.dart';
import 'package:cakeke/blocs/custom/custom_event.dart';
import 'package:cakeke/blocs/custom/custom_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/main/custom/custom_text_color_grid_view.dart';
import 'package:cakeke/view/widgets/main/custom/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFieldLayout extends StatelessWidget {
  const CustomTextFieldLayout(
      {super.key, required this.textController, required this.event});

  final TextEditingController textController;
  final Function(CustomEvent) event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomBloc, CustomState>(buildWhen: (previous, current) {
      return previous.selectTextColor != current.selectTextColor;
    }, builder: (context, state) {
      return Container(
        color: DesignSystem.colors.white,
        child: Column(
          children: [
            CustomTextField(
              onSubmitted: (text) {
                if (text.isNotEmpty) {
                  event(AddCustomEvent(
                      asset: text,
                      widget: Text(
                        text,
                        style: TextStyle(color: state.selectTextColor),
                      )));
                }
              },
              controller: textController,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: CustomTextColorGridView(
                  onColorTap: (color) {
                    event(SelectTextColorEvent(selectTextColor: color));
                  },
                  selectTextColor: state.selectTextColor,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
