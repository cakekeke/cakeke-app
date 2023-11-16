import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/main/map/map_list_view_button.dart';
import 'package:cakeke/view/widgets/main/map/map_location_button.dart';
import 'package:cakeke/view/widgets/main/map/map_layout.dart';
import 'package:cakeke/view/widgets/main/map/map_search_field.dart';
import 'package:cakeke/view/widgets/main/map/map_store_list.dart';
import 'package:flutter/material.dart';

class MapMainPage extends StatelessWidget {
  const MapMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldLayout(
      bodyWidget: Stack(
        children: [
          MapLayout(),
          MapSearchField(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    Center(child: MapListViewButton()),
                    Positioned(right: 16, child: MapLocationButton()),
                  ],
                ),
              ),
              MapStoreList()
            ],
          ),
        ],
      ),
    );
  }
}
