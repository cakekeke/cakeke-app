import 'package:cakeke/blocs/auth/auth_bloc.dart';
import 'package:cakeke/blocs/map/map_bloc.dart';
import 'package:cakeke/blocs/custom/custom_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/sign_in/sign_in_bloc.dart';
import 'package:cakeke/blocs/tab/tab_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get landingPageBlocProviders => [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => SignInBloc()),
      ];

  static get mainPageBlocProviders => [
        BlocProvider(create: (context) => TabBloc()),
        BlocProvider(create: (context) => MapBloc()),
        BlocProvider(create: (context) => CustomBloc()),
        BlocProvider(create: (context) => MypageBloc()),
      ];
}
