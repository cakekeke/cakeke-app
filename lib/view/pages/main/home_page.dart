import 'package:cakeke/blocs/home_bloc/home_bloc.dart';
import 'package:cakeke/blocs/home_bloc/home_event.dart';
import 'package:cakeke/blocs/home_bloc/home_state.dart';
import 'package:cakeke/view/pages/main/home/home_main_page.dart';
import 'package:cakeke/view/pages/main/home/home_store_list_page.dart';
import 'package:cakeke/view/pages/main/map/store_detail_page.dart';
import 'package:cakeke/view/pages/main/map/store_list_page.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
        isSafeArea: true,
        bodyWidget: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return IndexedStack(
              index: state.selectedPage,
              children: [
                const HomeMainPage(),
                const HomeStoreListPage(),
                StoreDetailPage(
                  onBackButtonPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(const HomePageChanged(selectedPage: 0));
                  },
                )
              ],
            );
          },
        ));
  }
}
