import 'package:cakeke/blocs/sign_up/sign_up_event.dart';
import 'package:cakeke/blocs/sign_up/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<IdDuplicationCheck>(_handleDuplicationIdCheckEvent);
    on<IdChangedEvent>(_handleIdChangedEvent);
    on<ButtonTapEvent>(_handleButtonTapEvent);
    on<PasswordChangedEvent>(_handlePasswordChangedEvent);
    on<RePasswordChangedEvent>(_handlePasswordCheckEvent);
    on<PurposeChangedEvent>(_handlePurposeChangedEvent);
    on<ProfileIdChangedEvent>(_handleProfileIdChangedEvent);
    on<BirthChangedEvent>(_handleBirthChangedEvent);
    on<GenderChangedEvent>(_handleGenderChangedEvent);
  }

  void _handleDuplicationIdCheckEvent(
    IdDuplicationCheck event,
    Emitter<SignUpState> emit,
  ) {
    if (state.isValidId ?? false) {
      // state.id

      // API 진행 후 결과 emit
      // emit(state.copyWith(isDuplicationId: true, isButtonActive: true));
    }
  }

  void _handleButtonTapEvent(
    ButtonTapEvent event,
    Emitter<SignUpState> emit,
  ) {
    if (event.isLastSignLevel) {
      // 회원가입 API 요청
    }
    emit(state.copyWith(isButtonActive: false));
  }

  void _handleIdChangedEvent(
    IdChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    bool isValidId = true;
    if (!RegExp(r"^[a-zA-Z0-9]*$").hasMatch(event.id) || event.id.length < 8) {
      isValidId = false;
    }

    emit(state.copyWith(id: event.id, isValidId: isValidId));
  }

  void _handlePasswordChangedEvent(
    PasswordChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    final password = List.of(state.password);
    password[event.index] = event.password;
    emit(state.copyWith(
        password: password, isButtonActive: password.join().length > 5));
  }

  void _handlePasswordCheckEvent(
    RePasswordChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    final password = List.of(state.rePassword);
    password[event.index] = event.rePassword;
    final isMatch = password.join() == state.password.join();
    emit(state.copyWith(
        rePassword: password, passwordCheck: isMatch, isButtonActive: isMatch));
  }

  void _handleBirthChangedEvent(
    BirthChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
        birth: event.birth,
        isButtonActive: state.gender.isNotEmpty && event.birth.length > 5));
  }

  void _handleGenderChangedEvent(
    GenderChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
        gender: event.gender,
        isButtonActive: event.gender.isNotEmpty && state.birth.length > 5));
  }

  void _handlePurposeChangedEvent(
    PurposeChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
        purpose: event.purpose, isButtonActive: event.purpose.isNotEmpty));
  }

  void _handleProfileIdChangedEvent(
    ProfileIdChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(profileId: event.profileId, isButtonActive: true));
  }
}
