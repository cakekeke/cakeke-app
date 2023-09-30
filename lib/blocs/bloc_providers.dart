import 'package:cakeke/blocs/sign_up/sign_up_bloc.dart';
import 'package:cakeke/blocs/tab/tab_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  final tabBloc = TabBloc();
  static get allBlocProviders => [
        BlocProvider(create: (context) => TabBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
      ];
}
