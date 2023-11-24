import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/blocs/store/store_bloc.dart';
import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/view/widgets/common/store_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapStoreCard extends StatelessWidget {
  const MapStoreCard({super.key, required this.store});

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: StoreCard(
        store: store,
        onTap: () {
          context.read<StoreBloc>().add(StoreEventStoreSelect(
                selectStore: store,
              ));
          context
              .read<MapBloc>()
              .add(const MapPageChanged(selectedPage: 2, isListChanged: true));
        },
      ),
    );
  }
}
