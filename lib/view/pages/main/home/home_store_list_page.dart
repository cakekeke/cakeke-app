import 'package:cakeke/blocs/home/home_bloc.dart';
import 'package:cakeke/blocs/home/home_event.dart';
import 'package:cakeke/blocs/home/home_state.dart';
import 'package:cakeke/blocs/store/store_bloc.dart';
import 'package:cakeke/view/widgets/common/empty_list_text.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/home/home_store_card.dart';
import 'package:cakeke/view/widgets/home/store_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeStoreListPage extends StatelessWidget {
  const HomeStoreListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final storeList = state.storeList.sublist(0, 4);
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
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    children: [
                      // Container(
                      //   padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      //   child: const StoreFilter(),
                      // ),
                      Expanded(
                          child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                        itemCount: storeList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HomeStoreCard(
                            store: storeList[index],
                            index: index,
                            onTap: () {
                              context.read<HomeBloc>().add(HomePageChanged(
                                    selectedPage: HomeTab.detail.index,
                                  ));
                              context
                                  .read<StoreBloc>()
                                  .add(StoreEventStoreSelect(
                                    selectStore: storeList[index],
                                  ));
                            },
                            isLast: index == storeList.length - 1,
                          );
                        },
                      ))
                    ],
                  ),
                ),
        );
      },
    );
  }
}
