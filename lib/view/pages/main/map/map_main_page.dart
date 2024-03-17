import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/main/map/map_list_view_button.dart';
import 'package:cakeke/view/widgets/main/map/map_location_button.dart';
import 'package:cakeke/view/widgets/main/map/map_layout.dart';
import 'package:cakeke/view/widgets/main/map/map_search_field.dart';
import 'package:cakeke/view/widgets/main/map/map_store_list.dart';
import 'package:flutter/material.dart';

class MapMainPage extends StatefulWidget {
  const MapMainPage({super.key});

  @override
  State<MapMainPage> createState() => _MapMainPageState();
}

class _MapMainPageState extends State<MapMainPage> {
  final FocusNode searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    searchFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      bodyWidget: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            const MapLayout(),
            MapSearchField(searchFocus: searchFocus),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      Center(child: MapListViewButton()),
                      Positioned(right: 16, child: MapLocationButton()),
                    ],
                  ),
                ),
                Visibility(
                  visible: !searchFocus.hasFocus,
                  child: const MapStoreList(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
