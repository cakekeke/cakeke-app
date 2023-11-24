import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/blocs/store/store_bloc.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/view/widgets/common/store_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapStoreListItem extends StatelessWidget {
  const MapStoreListItem({
    super.key,
    required this.store,
  });

  final Store store;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.read<StoreBloc>().add(StoreEventStoreSelect(
                selectStore: store,
              ));
          context.read<MapBloc>().add(const MapPageChanged(
                selectedPage: 2,
              ));
        },
        child: Container(
            margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
            padding: const EdgeInsets.all(12),
            constraints: const BoxConstraints(minHeight: 120),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: DesignSystem.colors.white,
                boxShadow: [
                  BoxShadow(
                    color: DesignSystem.colors.black.withOpacity(0.33),
                    blurRadius: 10,
                  )
                ]),
            child: StoreCard(
              store: store,
            )));
  }
}
