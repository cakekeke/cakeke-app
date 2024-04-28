import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/view/widgets/common/store_card.dart';
import 'package:flutter/material.dart';

class MapStoreCard extends StatelessWidget {
  const MapStoreCard({super.key, required this.store});

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: StoreCard(
        store: store,
        onTap: () {
          Navigator.pushNamed(context, '/store_detail', arguments: store);
        },
      ),
    );
  }
}
