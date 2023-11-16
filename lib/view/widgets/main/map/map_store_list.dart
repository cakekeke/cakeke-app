import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_state.dart';
import 'package:cakeke/blocs/store/store_bloc.dart';
import 'package:cakeke/view/pages/main/map/map_store_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapStoreList extends StatelessWidget {
  const MapStoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(buildWhen: (previous, current) {
      return previous.selectMaker != current.selectMaker;
    }, builder: (context, state) {
      if (state.makerList == null || state.selectMaker == null) {
        return Container();
      }

      final selectMaker =
          state.makerList!.where((element) => element == state.selectMaker);
      final storeList = context.read<StoreBloc>().state.storeList;

      if (selectMaker.isEmpty && (storeList ?? []).isEmpty) {
        return Container();
      }

      final store = storeList!
          .where(
              (element) => element.id == int.parse(selectMaker.first.info.id))
          .first;
      return MapStoreListItem(store: store);
    });
  }
}
