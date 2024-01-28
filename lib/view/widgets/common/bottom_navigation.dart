import 'package:cakeke/blocs/home/home_bloc.dart';
import 'package:cakeke/blocs/home/home_event.dart';
import 'package:cakeke/blocs/home/home_state.dart';
import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/blocs/tab/tab_bloc.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, state) {
        return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: '지도',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit_document),
                label: '큐레이션',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.light_mode),
                label: '커스텀',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: '마이페이지',
              ),
            ],
            currentIndex: state.tabIndex,
            selectedItemColor: DesignSystem.colors.appPrimary,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            // icon이랑 간격
            selectedIconTheme: const IconThemeData(size: 20),
            unselectedItemColor: const Color(0xff767676),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              context.read<TabBloc>().add(TabChanged(selectedIndex: index));
              context
                  .read<HomeBloc>()
                  .add(HomePageChanged(selectedPage: HomeTab.main.index));
              context
                  .read<MapBloc>()
                  .add(const MapPageChanged(selectedPage: 0));
              context
                  .read<MypageBloc>()
                  .add(const MypagePageChanged(selectedPage: 0));
            });
      },
    );
  }
}
