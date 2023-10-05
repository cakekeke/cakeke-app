import 'package:flutter/material.dart';

class CustomTabViewList extends StatelessWidget {
  const CustomTabViewList({
    super.key,
    required this.addAssetList,
    required this.onTap,
  });

  final List<String> addAssetList;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final iconImages =
        addAssetList.where((element) => element.contains('icon_'));

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: iconImages.length,
        itemBuilder: (context, index) {
          final asset = iconImages.elementAt(index);
          return GestureDetector(
              onTap: () => onTap(addAssetList.elementAt(index)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(asset),
              ));
        });
  }
}
