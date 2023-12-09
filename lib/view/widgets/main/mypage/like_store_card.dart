import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/blocs/store/store_bloc.dart';
import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/view/widgets/common/store_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeStoreCard extends StatelessWidget {
  const LikeStoreCard({super.key, required this.store});

  final Store store;

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
      child: StoreCard(
        store: store,
        onTap: () {
          context.read<StoreBloc>().add(StoreEventStoreSelect(
                selectStore: store,
              ));
          context.read<MypageBloc>().add(const MypagePageChanged(
                selectedPage: 3,
              ));
        },
      ),
    );
  }
}
