import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/blocs/map/map_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/main/map/main_text_field_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapSearchField extends StatelessWidget {
  const MapSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
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
                context.read<MapBloc>().add(SearchTextEvent(searchText: text));
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
          ),
        );
      },
    );
  }
}
