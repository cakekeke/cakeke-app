import 'package:cakeke/blocs/home/home_bloc.dart';
import 'package:cakeke/blocs/home/home_event.dart';
import 'package:cakeke/blocs/home/home_state.dart';
import 'package:cakeke/blocs/store/store_bloc.dart';
import 'package:cakeke/view/widgets/common/empty_list_text.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/common/store_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeStoreListPage extends StatelessWidget {
  const HomeStoreListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final storeList = state.storeList;

        return ScaffoldLayout(
          appBarText: state.storeListType == HomeStoreListType.newStore
              ? "신상 케이크 가게"
              : "지금 인기있는 케이크 가게",
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
                          child: ListView.separated(
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
                                context.read<HomeBloc>().add(HomePageChanged(
                                      selectedPage: HomeTab.detail.index,
                                    ));
                                context
                                    .read<StoreBloc>()
                                    .add(StoreEventStoreSelect(
                                      selectStore: storeList[index],
                                    ));
                              },
                            ),
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
