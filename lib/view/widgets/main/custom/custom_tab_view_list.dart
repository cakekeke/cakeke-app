import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomTabViewGrid extends StatelessWidget {
  const CustomTabViewGrid({
    super.key,
    required this.addAssetList,
    required this.onTap,
    this.selectItem,
  });

  final List<String> addAssetList;
  final String? selectItem;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final iconImages =
        addAssetList.where((element) => element.contains('icon_'));

    return Container(
      color: DesignSystem.colors.white,
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          padding: EdgeInsets.zero,
          itemCount: iconImages.length,
          itemBuilder: (context, index) {
            final asset = iconImages.elementAt(index);
            return GestureDetector(
              onTap: () => onTap(addAssetList.elementAt(index)),
              child: Container(
                margin: const EdgeInsets.all(27),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(asset),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(999)),
                  border: Border.all(
                    color: selectItem != null &&
                            selectItem == addAssetList.elementAt(index)
                        ? DesignSystem.colors.appPrimary
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
