import 'package:cakeke/view/widgets/common/store_card.dart';
import 'package:flutter/material.dart';

class LikeStoreCard extends StatelessWidget {
  const LikeStoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 8,
          ),
        ],
      ),
      child: const StoreCard(),
    );
  }
}
