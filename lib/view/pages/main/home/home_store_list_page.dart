import 'package:cakeke/blocs/home_bloc/home_bloc.dart';
import 'package:cakeke/blocs/home_bloc/home_event.dart';
import 'package:cakeke/blocs/home_bloc/home_state.dart';
import 'package:cakeke/view/widgets/common/empty_list_text.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/main/mypage/like_store_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeStoreListPage extends StatelessWidget {
  const HomeStoreListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final storeList = state.storeList ?? [];
        return ScaffoldLayout(
          appBarText: state.storeListType == HomeStoreListType.newStore
              ? "신상 케이크 집"
              : "지금 인기있는 케이크 집",
          isDetailPage: true,
          onBackButtonPressed: () {
            context.read<HomeBloc>().add(HomePageChanged(
                  selectedPage: HomeTab.main.index,
                ));
          },
          isSafeArea: true,
          bodyWidget: storeList.isEmpty
              ? const EmptyListText()
              : Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffF4F4F4),
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: storeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final store = storeList.elementAt(index);
                      return LikeStoreCard(store: store);
                    },
                  ),
                ),
        );
      },
    );
  }
}
