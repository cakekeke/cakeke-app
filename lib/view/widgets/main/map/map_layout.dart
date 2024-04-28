import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/blocs/map/map_state.dart';
import 'package:cakeke/blocs/store/store_bloc.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:location/location.dart';

class MapLayout extends StatefulWidget {
  const MapLayout({
    super.key,
  });

  @override
  State<MapLayout> createState() => _MapLayoutState();
}

class _MapLayoutState extends State<MapLayout> {
  bool getUserLoacation = false;
  double latitude = 0;
  double longitude = 0;

  @override
  void initState() {
    super.initState();

    getUserLocation();
  }

  getUserLocation() async {
    final location = await Location().getLocation();
    latitude = location.latitude ?? 0;
    longitude = location.longitude ?? 0;

    getUserLoacation = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!getUserLoacation) {
      return Center(
        child: CircularProgressIndicator(
          color: DesignSystem.colors.appPrimary,
        ),
      );
    }
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
          options: NaverMapViewOptions(
              initialCameraPosition: NCameraPosition(
                  target: NLatLng(latitude, longitude), zoom: 16)),
          onMapReady: (naverMapController) {
            context.read<MapBloc>().add(SetMapControllerEvent(
                  mapController: naverMapController,
                  latitude: latitude,
                  longitude: longitude,
                ));
            BlocProvider.of<StoreBloc>(context).add(
                StoreEventFetchLocal(latitude: latitude, longitude: longitude));
          },
          onCameraIdle: () {
            context.read<MapBloc>().add(const OnMapCameraChangedEvent());
            context
                .read<MapBloc>()
                .add(const ResearchButtonVisible(isVisible: true));
          },
        ),
      );
    });
  }
}
