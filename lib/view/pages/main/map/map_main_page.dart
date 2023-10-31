import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/main/map/map_list_view_button.dart';
import 'package:cakeke/view/widgets/main/map/map_location_button.dart';
import 'package:cakeke/view/widgets/main/map/map_layout.dart';
import 'package:cakeke/view/widgets/main/map/map_search_field.dart';
import 'package:flutter/material.dart';

class MapMainPage extends StatelessWidget {
  const MapMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      bodyWidget: Stack(
        children: [
          const MapLayout(),
          const MapSearchField(),
          Positioned(
            left: (MediaQuery.of(context).size.width / 2) - (100 / 2),
            bottom: 16,
            child: const MapListViewButton(),
          ),
          const Positioned(right: 16, bottom: 16, child: MapLocationButton()),
        ],
      ),
    );
  }
}
