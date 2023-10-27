import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/blocs/map/map_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/main/home_location_button.dart';
import 'package:cakeke/view/widgets/main/home_map_layout.dart';
import 'package:cakeke/view/widgets/main/main_text_field_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      bodyWidget: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
        return Stack(
          children: [
            HomeMapLayout(
              onMapReady: (naverMapController) {
                context.read<MapBloc>().add(
                    SetMapControllerEvent(mapController: naverMapController));
              },
            ),
            Positioned(
                right: 16,
                bottom: 16,
                child: HomeLocationButton(onTap: () {
                  context.read<MapBloc>().add(const SetCurrentLocationEvent());
                })),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: DesignSystem.colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 10,
                    )
                  ]),
              child: MainTextFieldRow(
                onSubmitted: (text) {
                  context
                      .read<MapBloc>()
                      .add(SearchTextEvent(searchText: text));
                },
                onChanged: (text) {
                  context
                      .read<MapBloc>()
                      .add(SearchTextChangedEvent(searchText: text));
                },
                onSearchTap: () {
                  context.read<MapBloc>().add(const SearchTextEvent());
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
