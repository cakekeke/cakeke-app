import 'package:cakeke/blocs/like/like_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/common/store_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/common/empty_list_text.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeBloc, LikeState>(
      builder: (context, state) {
        final storeList = state.likeStoreList ?? [];
        return ScaffoldLayout(
          appBarText: "찜 목록",
          isDetailPage: true,
          onBackButtonPressed: () {
            context.read<MypageBloc>().add(const MypagePageChanged(
                  selectedPage: 0,
                ));
          },
          isSafeArea: true,
          bodyWidget: storeList.isEmpty
              ? const EmptyListText()
              : ListView.separated(
                  itemCount: storeList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: StoreCard(
                        store: storeList[index],
                        onTap: () {
                          Navigator.pushNamed(context, '/store_detail',
                              arguments: storeList[index]);
                        },
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
