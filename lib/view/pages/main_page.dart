import 'package:cakeke/blocs/tab/tab_bloc.dart';
import 'package:cakeke/view/pages/main/map_page.dart';
import 'package:cakeke/view/pages/main/reservation_page.dart';
import 'package:cakeke/view/pages/main/custom_page.dart';
import 'package:cakeke/view/pages/main/home_page.dart';
import 'package:cakeke/view/pages/main/my_page.dart';
import 'package:cakeke/view/widgets/common/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(builder: (context, state) {
      return Scaffold(
        body: IndexedStack(
          index: state.tabIndex,
          children: const [
            HomePage(
              key: PageStorageKey("home"),
            ),
            MapPage(
              key: PageStorageKey("map"),
            ),
            ReservationPage(
              key: PageStorageKey("reservation"),
            ),
            CustomPage(
              key: PageStorageKey("custom"),
            ),
            MyPage(
              key: PageStorageKey("my"),
            )
          ],
        ),
        bottomNavigationBar: const BottomNavigation(),
      );
    });
  }
}
