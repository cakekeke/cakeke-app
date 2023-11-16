import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/view/widgets/common/store_card.dart';
import 'package:flutter/material.dart';

class MapStoreListItem extends StatelessWidget {
  const MapStoreListItem({
    super.key,
    required this.store,
  });

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(minHeight: 120),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: DesignSystem.colors.white,
            boxShadow: [
              BoxShadow(
                color: DesignSystem.colors.black.withOpacity(0.33),
                blurRadius: 10,
              )
            ]),
        child: StoreCard(store: store));
  }
}
