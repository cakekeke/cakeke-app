import 'package:cakeke/blocs/sign_up/sign_up_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders =>
      [BlocProvider(create: (context) => SignUpBloc())];
}
