import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/blocs/map/map_state.dart';
import 'package:cakeke/view/pages/main/map/map_main_page.dart';
import 'package:cakeke/view/pages/review_page.dart';
import 'package:cakeke/view/pages/main/map/store_detail_page.dart';
import 'package:cakeke/view/pages/main/map/store_list_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return IndexedStack(
          index: state.selectedPage,
          children: [
            const MapMainPage(),
            const StoreListPage(),
            StoreDetailPage(
              onBackButtonPressed: () {
                context
                    .read<MapBloc>()
                    .add(const MapPageChanged(selectedPage: 0));
              },
            ),
          ],
        );
      },
    );
  }
}
