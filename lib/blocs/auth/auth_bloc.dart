import 'package:cakeke/blocs/auth/auth_event.dart';
import 'package:cakeke/blocs/auth/auth_state.dart';
import 'package:cakeke/data/models/auth_model.dart';
import 'package:cakeke/data/models/user_model.dart';
import 'package:cakeke/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthStateUnknown()) {
    on<AppStarted>(_onAppStarted);
    on<AuthEventSignin>(_onSignin);
    on<AuthEventSignout>(_onSignout);
  }

  void _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());
    final String? accessToken = await authRepository.checkToken();
    if (accessToken != null) {
      final User user = await authRepository.getUser(accessToken: accessToken);
      emit(AuthStateAuthenticated(user: user));
    } else {
      emit(AuthStateUnauthenticated());
    }
  }

  void _onSignin(AuthEventSignin event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());
    final Auth auth =
        await authRepository.signin(id: event.id, password: event.password);
    final User user =
        await authRepository.getUser(accessToken: auth.accessToken);
    emit(AuthStateAuthenticated(user: user));
  }

  void _onSignout(AuthEventSignout event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());
    await authRepository.signout();
    emit(AuthStateUnauthenticated());
  }
}
