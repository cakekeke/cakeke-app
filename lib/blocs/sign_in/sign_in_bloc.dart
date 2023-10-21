import 'package:cakeke/blocs/sign_in/sign_in_event.dart';
import 'package:cakeke/blocs/sign_in/sign_in_state.dart';
import 'package:cakeke/data/providers/sign_in_provider.dart';
import 'package:cakeke/data/repositories/sign_in_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<IdChangedEvent>(_handleIdChangedEvent);
    on<PasswordChangedEvent>(_handlePasswordChangedEvent);
    on<LoginEvent>(_handleLoginEvent);
  }

  final SignInRepository signInRepository =
      SignInRepository(signinProvider: SignInProvider());

  void _handleIdChangedEvent(
    IdChangedEvent event,
    Emitter<SignInState> emit,
  ) {
    bool isValidId = true;
    if (!RegExp(r"^[a-zA-Z0-9]*$").hasMatch(event.id) || event.id.length < 8) {
      isValidId = false;
    }

    emit(state.copyWith(
        id: event.id,
        isValidId: isValidId,
        isButtonActive: isValidId && state.password.join().length > 5));
  }

  void _handlePasswordChangedEvent(
    PasswordChangedEvent event,
    Emitter<SignInState> emit,
  ) {
    final password = List.of(state.password);
    password[event.index] = event.password;
    emit(state.copyWith(
        password: password, isButtonActive: password.join().length > 5));
  }

  void _handleLoginEvent(
    LoginEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInStateLoading());

    try {
      await signInRepository.signin(id: event.id, password: event.password);
      emit(const SignInStateSuccess(message: '로그인 성공'));
      return;
    } catch (e) {
      emit(const SignInStateFailure(message: '로그인 실패'));
      return;
    }
  }
}
