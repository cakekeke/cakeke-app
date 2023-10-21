import 'package:cakeke/blocs/auth/auth_bloc.dart';
import 'package:cakeke/blocs/auth/auth_event.dart';
import 'package:cakeke/blocs/auth/auth_state.dart';
import 'package:cakeke/blocs/bloc_providers.dart';
import 'package:cakeke/config/routes/router_generator.dart';
import 'package:cakeke/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final authBloc = AuthBloc();
    authBloc.add(const AppStarted());
    return BlocBuilder(
        bloc: authBloc,
        builder: (context, state) {
          if (state is AuthStateAuthenticated) {
            FlutterNativeSplash.remove();
            return MultiBlocProvider(
              providers: AppBlocProviders.allBlocProviders,
              child: const MaterialApp(
                  title: 'Cakeke',
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: RouteGenerator.generateRoute,
                  initialRoute: Routes.main),
            );
          } else if (state is AuthStateUnauthenticated) {
            FlutterNativeSplash.remove();
          }
          return MultiBlocProvider(
              providers: AppBlocProviders.allBlocProviders,
              child: const MaterialApp(
                title: 'Cakeke',
                debugShowCheckedModeBanner: false,
                onGenerateRoute: RouteGenerator.generateRoute,
                initialRoute: Routes.landing,
              ));
        });
  }
}
