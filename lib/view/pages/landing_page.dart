import 'package:cakeke/blocs/auth/auth_bloc.dart';
import 'package:cakeke/blocs/auth/auth_event.dart';
import 'package:cakeke/blocs/auth/auth_state.dart';
import 'package:cakeke/config/routes/routes.dart';
import 'package:cakeke/view/pages/splash_page.dart';
import 'package:cakeke/view/widgets/landing/landing_logo.dart';
import 'package:cakeke/view/widgets/landing/signin_button.dart';
import 'package:cakeke/view/widgets/landing/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthStateUnknown) {
        context.read<AuthBloc>().add(const AppStarted());
      } else if (state is AuthStateAuthenticated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.main, (route) => false);
          FlutterNativeSplash.remove();
        });
      } else if (state is AuthStateUnauthenticated) {
        FlutterNativeSplash.remove();
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Center(
                    child: LandingLogo(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SignupButton(),
                      SizedBox(height: 16),
                      SigninButton()
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      }
      return const SplashPage();
    });
  }
}
