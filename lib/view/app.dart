import 'package:cakeke/blocs/bloc_providers.dart';
import 'package:cakeke/config/routes/router_generator.dart';
import 'package:cakeke/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: const MaterialApp(
        title: 'Cakeke',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: Routes.landing,
      ),
    );
  }
}
