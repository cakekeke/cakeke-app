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
    return BlocBuilder<MapBloc, MapState>(builder: (context, state) {
      return BlocListener<StoreBloc, StoreState>(
        listener: (context, storeState) {
          if (state.setMakerFlag) {
            context.read<MapBloc>().add(
                SetMakerEvent(context: context, stores: storeState.storeList));
          }
        },
        child: NaverMap(
          options: const NaverMapViewOptions(
            initialCameraPosition: NCameraPosition(
              target: NLatLng(37.5665, 126.9780),
              zoom: 14,
            ),
          ),
          onMapReady: (naverMapController) {
            context
                .read<MapBloc>()
                .add(SetMapControllerEvent(mapController: naverMapController));

            Future.delayed(const Duration(milliseconds: 100), () {
              naverMapController
                  .getCameraPosition()
                  .then((p) => p.target)
                  .then((nowPosition) {
                BlocProvider.of<StoreBloc>(context).add(StoreEventFetchLocal(
                    latitude: nowPosition.latitude,
                    longitude: nowPosition.longitude));
              });
            });
          },
          onCameraIdle: () {
            context.read<MapBloc>().add(const OnMapCameraChangedEvent());
          },
        ),
      );
    });
  }
}
