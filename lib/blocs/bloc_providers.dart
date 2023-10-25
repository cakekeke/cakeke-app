import 'package:cakeke/blocs/auth/auth_bloc.dart';
import 'package:cakeke/blocs/home/home_bloc.dart';
import 'package:cakeke/blocs/custom/custom_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/sign_in/sign_in_bloc.dart';
import 'package:cakeke/blocs/tab/tab_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => TabBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => CustomBloc()),
        BlocProvider(create: (context) => MypageBloc()),
      ];
}
