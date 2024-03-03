import 'package:cakeke/blocs/home/home_bloc.dart';
import 'package:cakeke/blocs/home/home_event.dart';
import 'package:cakeke/blocs/home/home_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/home/home_header.dart';
import 'package:cakeke/view/widgets/home/home_store_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.newStore.isEmpty && state.popularStore.isEmpty) {
          context.read<HomeBloc>().add(const HomeInitialEvent());
          return Center(
            child: CircularProgressIndicator(
              color: DesignSystem.colors.appPrimary,
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                const HomeHeader(),
                HomeStoreList(
                  title: "신상 케이크 집",
                  storeList: state.newStore,
                  moveListPage: () {
                    context.read<HomeBloc>().add(const HomeStoreListFetch(
                          type: HomeStoreListType.newStore,
                        ));
                    context.read<HomeBloc>().add(HomePageChanged(
                          selectedPage: HomeTab.list.index,
                        ));
                  },
                ),
                // HomeStoreList(
                //   title: "지금 인기있는 케이크 집",
                //   storeList: state.popularStore,
                //   moveListPage: () {
                //     context.read<HomeBloc>().add(HomePageChanged(
                //           selectedPage: HomeTab.list.index,
                //         ));
                //     context.read<HomeBloc>().add(const HomeStoreListFetch(
                //           storeList: [],
                //           type: HomeStoreListType.popularStore,
                //         ));
                //   },
                // ),
              ],
            ),
          );
        }
      },
    );
  }
}
