import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapLocationButton extends StatelessWidget {
  const MapLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.read<MapBloc>().add(const SetCurrentLocationEvent());
        },
        child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: DesignSystem.colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 10,
                  )
                ]),
            child: Icon(
              Icons.my_location,
              color: DesignSystem.colors.black,
            )));
  }
}
