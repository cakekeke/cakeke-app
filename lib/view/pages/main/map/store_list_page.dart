import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/blocs/store/store_bloc.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/main/map/map_store_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreListPage extends StatelessWidget {
  const StoreListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreBloc, StoreState>(
      buildWhen: (previous, current) {
        return previous.storeList != current.storeList;
      },
      builder: (context, state) {
        return ScaffoldLayout(
          appBarText: "현재위치 가게 리스트",
          isDetailPage: true,
          onBackButtonPressed: () {
            context.read<MapBloc>().add(const MapPageChanged(
                  selectedPage: 0,
                ));
          },
          isSafeArea: true,
          bodyWidget: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: DesignSystem.colors.dividerCard,
                  width: 1,
                ),
              ),
            ),
            child: ListView.separated(
              itemCount: (state.storeList ?? []).length,
              itemBuilder: (BuildContext context, int index) {
                final store = state.storeList!.elementAt(index);
                return MapStoreCard(
                  store: store,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          ),
        );
      },
    );
  }
}
