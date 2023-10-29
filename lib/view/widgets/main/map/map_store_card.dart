import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/common/store_card.dart';
import 'package:flutter/material.dart';

class MapStoreCard extends StatelessWidget {
  const MapStoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: DesignSystem.colors.dividerCard,
            width: 1,
          ),
        ),
      ),
      child: const StoreCard(),
    );
  }
}
