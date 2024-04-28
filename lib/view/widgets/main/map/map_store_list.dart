import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/blocs/map/map_state.dart';
import 'package:cakeke/blocs/store/store_bloc.dart';
import 'package:cakeke/view/pages/main/map/map_store_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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
      return NotificationListener<ScrollEndNotification>(
        onNotification: (scrollNotification) {
          if (state.itemScrollController.position.userScrollDirection ==
              ScrollDirection.idle) {
            return true;
          }
          int storeIndex = state.selectStoreIndex;

          if (state.itemScrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
            storeIndex++;
          } else if (state.itemScrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
            storeIndex--;
          }
          context.read<MapBloc>().add(SelectStoreMakerEvent(
                maker: state.makerList!.elementAt(storeIndex),
                index: storeIndex,
              ));

          return true;
        },
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: state.itemScrollController,
            physics: const PageScrollPhysics(),
            child: Row(children: [
              for (int index = 0; index < storeList!.length; index++)
                AutoScrollTag(
                  key: ValueKey(index),
                  controller: state.itemScrollController,
                  index: index,
                  child: MapStoreListItem(store: storeList.elementAt(index)),
                )
            ])),
      );
    });
  }
}
