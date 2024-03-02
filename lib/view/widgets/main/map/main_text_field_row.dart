import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class MainTextFieldRow extends StatelessWidget {
  const MainTextFieldRow({
    super.key,
    required this.onSubmitted,
    required this.onChanged,
    required this.onSearchTap,
    required this.searchFocus,
  });

  final FocusNode searchFocus;
  final Function(String) onSubmitted;
  final Function(String) onChanged;
  final Function() onSearchTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                focusNode: searchFocus,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 4, bottom: 4),
                  hintText: '딸기 케이크 맛집을 검색해보세요',
                  hintStyle: DesignSystem.typography.body(TextStyle(
                    color: DesignSystem.colors.textHint,
                    fontWeight: FontWeight.w400,
                  )),
                ),
                onChanged: (text) => onChanged(text),
                onSubmitted: (text) => onSubmitted(text),
              ),
            ),
            GestureDetector(
              onTap: () => onSearchTap(),
              child: Icon(
                Icons.search,
                color: DesignSystem.colors.black,
              ),
            )
          ],
        ));
  }
}
