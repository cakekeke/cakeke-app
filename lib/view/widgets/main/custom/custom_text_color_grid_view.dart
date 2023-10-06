import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/main/custom/custom_stroke_text.dart';
import 'package:flutter/material.dart';

class CustomTextColorGridView extends StatelessWidget {
  const CustomTextColorGridView({
    super.key,
    required this.onColorTap,
  });

  final Function(Color) onColorTap;
  final colorList = const ['하양', '핑크', '파랑'];

  Color thisColor(String colorText) {
    Color color = DesignSystem.colors.white;

    if (colorText == '핑크') {
      color = DesignSystem.colors.textCustomPink;
    } else if (colorText == '파랑') {
      color = DesignSystem.colors.textCustomBlue;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        padding: EdgeInsets.zero,
        itemCount: colorList.length,
        itemBuilder: (context, index) {
          final colorText = colorList[index];
          final color = thisColor(colorText);
          return GestureDetector(
            onTap: () => onColorTap(color),
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: DesignSystem.colors.backgroundCustomText,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: Color(0xFFF2F2F2)),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              alignment: Alignment.center,
              child: CustomStrokeText(
                text: colorText,
                color: color,
              ),
            ),
          );
        });
  }
}
