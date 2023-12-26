import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/blocs/map/map_state.dart';
import 'package:cakeke/blocs/store/store_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class MapLayout extends StatelessWidget {
  const MapLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(buildWhen: (previous, current) {
      return previous.setMakerFlag != current.setMakerFlag;
    }, builder: (context, state) {
      return BlocListener<StoreBloc, StoreState>(
        listener: (context, storeState) {
          if (state.setMakerFlag) {
            context.read<MapBloc>().add(
                SetMakerEvent(context: context, stores: storeState.storeList));
          }
        },
        child: NaverMap(
          onMapReady: (naverMapController) {
            context.read<MapBloc>().add(SetMapControllerEvent(
                mapController: naverMapController,
                afterSetting: (nowPosition) {
                  BlocProvider.of<StoreBloc>(context).add(StoreEventFetchLocal(
                      latitude: nowPosition.latitude,
                      longitude: nowPosition.longitude));
                }));
          },
          onCameraIdle: () {
            context.read<MapBloc>().add(const OnMapCameraChangedEvent());
          },
        ),
      );
    });
  }
}
