import 'package:cakeke/data/models/common/store.dart';
import 'package:flutter/material.dart';

class HomeStoreCard extends StatelessWidget {
  const HomeStoreCard({
    super.key,
    required this.store,
    required this.onTap,
  });

  final Store store;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
