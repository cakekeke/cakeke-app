import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/blocs/map/map_state.dart';
import 'package:cakeke/blocs/store/store_bloc.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapResearchButton extends StatelessWidget {
  const MapResearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(buildWhen: (previous, current) {
      return previous.isMapCameraChanged != current.isMapCameraChanged;
    }, builder: (context, state) {
      if (!state.isMapCameraChanged) {
        return const SizedBox.shrink();
      }
      return SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context
                    .read<MapBloc>()
                    .add(ResearchFromMap(afterSearch: (longitude, latitude) {
                  BlocProvider.of<StoreBloc>(context).add(StoreEventFetchLocal(
                      latitude: latitude, longitude: longitude));
                  context.read<MapBloc>().add(const UpdateMapStoreEvent());
                }));
                Future.delayed(const Duration(milliseconds: 350), () {
                  context
                      .read<MapBloc>()
                      .add(const ResearchButtonVisible(isVisible: false));
                });
              },
              child: Container(
                margin: const EdgeInsets.only(top: 65),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '이 지역 재검색',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: DesignSystem.colors.appPrimary,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.refresh,
                      color: DesignSystem.colors.appPrimary,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
