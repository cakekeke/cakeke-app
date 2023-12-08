import 'package:cakeke/blocs/home_bloc/home_bloc.dart';
import 'package:cakeke/blocs/home_bloc/home_event.dart';
import 'package:cakeke/blocs/home_bloc/home_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/home/home_header.dart';
import 'package:cakeke/view/widgets/home/home_store_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(bodyWidget: BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.newStore.isEmpty) {
          context.read<HomeBloc>().add(const HomeInitialEvent());
          return Center(
            child: CircularProgressIndicator(
              color: DesignSystem.colors.appPrimary,
            ),
          );
        } else {
          return Column(
            children: [
              const HomeHeader(),
              HomeStoreList(title: "신상 케이크 집", storeList: state.newStore),
              HomeStoreList(
                  title: "지금 인기있는 케이크 집", storeList: state.popularStore),
            ],
          );
        }
      },
    ));
  }
}
