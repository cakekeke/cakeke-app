import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/main/map/map_button.dart';
import 'package:cakeke/view/widgets/main/map/map_list_view_button.dart';
import 'package:cakeke/view/widgets/main/map/map_layout.dart';
import 'package:cakeke/view/widgets/main/map/map_research_button.dart';
import 'package:cakeke/view/widgets/main/map/map_search_field.dart';
import 'package:cakeke/view/widgets/main/map/map_store_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            const MapResearchButton(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 16, bottom: 16),
                        child: MapButton(
                          icon: SvgPicture.asset(
                            'assets/images/icon_explore.svg',
                            fit: BoxFit.none,
                          ),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            context
                                .read<MapBloc>()
                                .add(const SetCameraRotationEvent());
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          const Center(child: MapListViewButton()),
                          Positioned(
                              right: 16,
                              child: MapButton(
                                icon: Icon(
                                  Icons.my_location,
                                  color: DesignSystem.colors.black,
                                ),
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  context
                                      .read<MapBloc>()
                                      .add(const SetCurrentLocationEvent());
                                },
                              )),
                        ],
                      ),
                    ),
                  ],
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
