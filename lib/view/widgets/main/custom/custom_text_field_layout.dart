import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/main/custom/custom_text_color_grid_view.dart';
import 'package:cakeke/view/widgets/main/custom/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomTextFieldLayout extends StatelessWidget {
  const CustomTextFieldLayout(
      {super.key, required this.textController, required this.addWidget});

  final TextEditingController textController;
  final Function(String, Widget) addWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignSystem.colors.white,
      child: Column(
        children: [
          CustomTextField(
            onSubmitted: (text) {
              if (text.isNotEmpty) {
                addWidget(
                    text,
                    Text(
                      text,
                    ));
              }
            },
            controller: textController,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: CustomTextColorGridView(
                onColorTap: (color) {
                  if (textController.text.isNotEmpty) {
                    addWidget(
                        textController.text,
                        Text(
                          textController.text,
                          style: TextStyle(color: color),
                        ));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
