import 'package:cakeke/blocs/filter/filter_bloc.dart';
import 'package:cakeke/blocs/filter/filter_state.dart';
import 'package:cakeke/blocs/home/home_bloc.dart';
import 'package:cakeke/blocs/home/home_event.dart';
import 'package:cakeke/blocs/home/home_state.dart';
import 'package:cakeke/config/routes/routes.dart';
import 'package:cakeke/data/arguments/storeDetail.dart';
import 'package:cakeke/view/widgets/common/empty_list_text.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/common/store_card.dart';
import 'package:cakeke/view/widgets/home/store_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeStoreListPage extends StatefulWidget {
  const HomeStoreListPage({super.key});

  @override
  State<HomeStoreListPage> createState() => _HomeStoreListPageState();
}

class _HomeStoreListPageState extends State<HomeStoreListPage> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, filterState) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, homeState) {
            if (filterState.selectedCity != homeState.city ||
                filterState.selectedDistrict != homeState.district) {
              context.read<HomeBloc>().add(HomeRegionStoreRankingFetch(
                    city: filterState.selectedCity,
                    district: filterState.selectedDistrict,
                  ));
            }

            final storeList =
                homeState.storeListType == HomeStoreListType.newStore
                    ? homeState.newStore
                    : homeState.regionStoreRanking;

            return ScaffoldLayout(
              appBarText: homeState.storeListType == HomeStoreListType.newStore
                  ? "신상 케이크 가게"
                  : "지금 인기있는 케이크 가게",
              isDetailPage: true,
              onBackButtonPressed: () {
                context.read<HomeBloc>().add(HomePageChanged(
                      selectedPage: HomeTab.main.index,
                    ));
                scrollController.jumpTo(0);
              },
              isSafeArea: true,
              bodyWidget: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Column(
                  children: [
                    homeState.storeListType == HomeStoreListType.popularStore
                        ? Container(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                            child: const StoreFilter(),
                          )
                        : Container(),
                    storeList.isEmpty
                        ? const Expanded(child: EmptyListText())
                        : Expanded(
                            child: ListView.separated(
                            controller: scrollController,
                            itemCount: storeList.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: StoreCard(
                                  store: storeList[index],
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.storeDetail,
                                        arguments: StoreDetailScreenArguments(
                                          store: storeList[index],
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
      },
    );
  }
}
