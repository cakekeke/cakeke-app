import 'package:cakeke/blocs/sign_up/sign_up_event.dart';
import 'package:cakeke/blocs/sign_up/sign_up_state.dart';
import 'package:cakeke/data/models/common/user.dart';
import 'package:cakeke/data/providers/sign_up_provider.dart';
import 'package:cakeke/data/repositories/sign_up_repository.dart';
import 'package:cakeke/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState(user: User())) {
    on<IdDuplicationCheck>(_handleDuplicationIdCheckEvent);
    on<IdChangedEvent>(_handleIdChangedEvent);
    on<ButtonTapEvent>(_handleButtonTapEvent);
    on<PasswordChangedEvent>(_handlePasswordChangedEvent);
    on<CheckPasswordChangedEvent>(_handlePasswordCheckEvent);
    on<PurposeChangedEvent>(_handlePurposeChangedEvent);
    on<ProfileIdChangedEvent>(_handleProfileIdChangedEvent);
    on<BirthChangedEvent>(_handleBirthChangedEvent);
    on<SexChangedEvent>(_handleSexChangedEvent);
  }

  final repository = SignUpRepository(signUpProvider: SignUpProvider());

  Future<void> _handleDuplicationIdCheckEvent(
    IdDuplicationCheck event,
    Emitter<SignUpState> emit,
  ) async {
    await repository.checkIdDuplicate(state.user.userId).then((isDuplication) {
      emit(state.copyWith(
          isDuplicationId: isDuplication,
          isButtonActive: isDuplication == false));
    });
  }

  Future<void> _handleButtonTapEvent(
    ButtonTapEvent event,
    Emitter<SignUpState> emit,
  ) async {
    if (event.isPurposeLevel) {
      final result = await repository.getServicePurpose();
      emit(state.copyWith(purpose: result));
    }
    if (event.isLastSignLevel) {
      final user = state.user;

      await repository
          .signUp(
              userId: user.userId,
              age: user.age,
              sex: user.sex,
              password: user.password,
              image: user.image,
              checkPassword: state.checkPassword.join(),
              servicePurpose: user.servicePurpose)
          .then((isComplete) {
        if (isComplete) {
          emit(state.copyWith(isButtonActive: false));
        } else {
          Utils.showSnackBar(event.context, '회원가입에 실패하였습니다.');
        }
      });
    } else {
      emit(state.copyWith(isButtonActive: false));
    }
  }

  void _handleIdChangedEvent(
    IdChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    bool isValidId = Utils.validateId(event.id);

    emit(state.copyWith(
        user: state.user.copyWith(userId: event.id), isValidId: isValidId));
  }

  void _handlePasswordChangedEvent(
    PasswordChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    final password = List.of(state.password);
    password[event.index] = event.password;
    emit(state.copyWith(
        user: state.user.copyWith(password: password.join()),
        password: password,
        isButtonActive: password.join().length > 5));
  }

  void _handlePasswordCheckEvent(
    CheckPasswordChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    final password = List.of(state.checkPassword);
    password[event.index] = event.checkPassword;
    final isMatch = password.join() == state.password.join();
    emit(state.copyWith(
        checkPassword: password,
        passwordCheck: isMatch,
        isButtonActive: isMatch));
  }

  void _handleBirthChangedEvent(
    BirthChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    if (event.birth.length > 3) {
      final birthYear =
          '${state.user.sex == "3" || state.user.sex == "4" ? 20 : 19}${event.birth.substring(0, 2)}';
      DateTime birthDate = DateFormat('yyyy').parse(birthYear);

      emit(state.copyWith(
          user: state.user.copyWith(
            age: DateTime.now().year - birthDate.year,
          ),
          isButtonActive: state.user.age != 0 && state.user.sex.isNotEmpty));
    }
  }

  void _handleSexChangedEvent(
    SexChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    final sex = (event.sex == "2" || event.sex == "4") ? "여성" : "남성";
    emit(state.copyWith(
        user: state.user.copyWith(sex: sex),
        isButtonActive: state.user.age != 0 && state.user.sex.isNotEmpty));
  }

  void _handlePurposeChangedEvent(
    PurposeChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
        user: state.user.copyWith(servicePurpose: event.selectPurpose),
        isButtonActive: event.selectPurpose.isNotEmpty));
  }

  void _handleProfileIdChangedEvent(
    ProfileIdChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
        user: state.user
            .copyWith(image: 'profile_icon_${event.profileId + 1}.svg'),
        isButtonActive: true));
  }
}
