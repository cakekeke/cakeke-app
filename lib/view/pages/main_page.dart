import 'package:cakeke/blocs/auth/auth_bloc.dart';
import 'package:cakeke/blocs/auth/auth_state.dart';
import 'package:cakeke/blocs/bloc_providers.dart';
import 'package:cakeke/blocs/custom/custom_bloc.dart';
import 'package:cakeke/blocs/custom/custom_event.dart';
import 'package:cakeke/blocs/like/like_bloc.dart';
import 'package:cakeke/blocs/tab/tab_bloc.dart';
import 'package:cakeke/config/routes/routes.dart';
import 'package:cakeke/view/pages/main/map/map_page.dart';
import 'package:cakeke/view/pages/main/reservation_page.dart';
import 'package:cakeke/view/pages/main/custom_page.dart';
import 'package:cakeke/view/pages/main/home_page.dart';
import 'package:cakeke/view/pages/main/mypage/my_page.dart';
import 'package:cakeke/view/widgets/common/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.mainPageBlocProviders,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthStateUnknown) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.landing, (route) => false);
            });
          } else if (state is AuthStateAuthenticated) {
            context.read<LikeBloc>().add(const LikeEventFetchLike());
          }

          return BlocBuilder<TabBloc, TabState>(builder: (context, state) {
            if (state.tabIndex == 3) {
              context
                  .read<CustomBloc>()
                  .add(ShowTutorialEvent(context: context));
            }

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
        },
      ),
    );
  }
}
