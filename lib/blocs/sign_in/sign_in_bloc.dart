import 'package:cakeke/blocs/sign_in/sign_in_event.dart';
import 'package:cakeke/blocs/sign_in/sign_in_state.dart';
import 'package:cakeke/data/providers/sign_in_provider.dart';
import 'package:cakeke/data/providers/user_provider.dart';
import 'package:cakeke/data/repositories/sign_in_repository.dart';
import 'package:cakeke/data/repositories/user_repository.dart';
import 'package:cakeke/data/source/local/prefs.dart';
import 'package:cakeke/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/source/local/storage.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<IdChangedEvent>(_handleIdChangedEvent);
    on<PasswordChangedEvent>(_handlePasswordChangedEvent);
    on<LoginEvent>(_handleLoginEvent);
    on<LoginSucessEvent>(_handleLoginSucessEvent);
  }

  final SignInRepository signInRepository =
      SignInRepository(signinProvider: SignInProvider());

  void _handleIdChangedEvent(
    IdChangedEvent event,
    Emitter<SignInState> emit,
  ) {
    bool isValidId = Utils.validateId(event.id);

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
    try {
      await signInRepository.signin(id: event.id, password: event.password);

      final userInfo =
          await UserRepository(userProvider: UserProvider()).getUser();
      Storage.write(Storage.uid, '${userInfo.id}');
      Prefs.setString(
          Prefs.profileFileName, 'assets/images/profile_icon_1.svg');
      Prefs.setString(Prefs.name, userInfo.name);

      emit(state.copyWith(
          loginSuccess: true, loginFailure: false, isButtonActive: false));
    } catch (e) {
      emit(state.copyWith(loginSuccess: false, loginFailure: true));
    }
  }

  void _handleLoginSucessEvent(
    LoginSucessEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(loginSuccess: false, loginFailure: false));
  }
}
