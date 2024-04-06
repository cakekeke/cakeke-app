import 'package:cakeke/blocs/auth/auth_event.dart';
import 'package:cakeke/blocs/auth/auth_state.dart';
import 'package:cakeke/data/repositories/auth_repository.dart';
import 'package:cakeke/data/repositories/token_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateUnknown()) {
    on<AppStarted>(_onAppStarted);
    on<AuthEventSignout>(_onSignout);
    on<AuthEventWithdrawal>(_onWithdrawal);
  }

  final AuthRepository authRepository = AuthRepository();

  void _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());
    final String? accessToken = await authRepository.checkToken();
    if (accessToken != null) {
      TokenRepository().saveAccessToken(accessToken);
      emit(AuthStateAuthenticated());
    } else {
      emit(AuthStateUnauthenticated());
    }
  }

  void _onSignout(AuthEventSignout event, Emitter<AuthState> emit) async {
    await authRepository.signout();
    emit(AuthStateUnknown());
  }

  void _onWithdrawal(AuthEventWithdrawal event, Emitter<AuthState> emit) async {
    await authRepository.withdrawal();
    emit(AuthStateUnknown());
  }
}
