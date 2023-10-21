import 'package:cakeke/blocs/auth/auth_event.dart';
import 'package:cakeke/blocs/auth/auth_state.dart';
import 'package:cakeke/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateUnknown()) {
    on<AppStarted>(_onAppStarted);
  }

  final AuthRepository authRepository = AuthRepository();

  void _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());
    final String? accessToken = await authRepository.checkToken();
    if (accessToken != null) {
      emit(AuthStateAuthenticated());
    } else {
      emit(AuthStateUnauthenticated());
    }
  }
}
