import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/blocs/map/map_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapListViewButton extends StatelessWidget {
  const MapListViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: DesignSystem.colors.appPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
      ),
      onPressed: () {
        context.read<MapBloc>().add(const MapPageChanged(
              selectedPage: 1,
            ));
      },
      child: Text(
        "리스트 전체보기",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: DesignSystem.textStyle.bold.fontWeight,
        ),
      ),
    );
  }
}
