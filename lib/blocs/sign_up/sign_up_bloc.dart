import 'package:cakeke/blocs/sign_up/sign_up_event.dart';
import 'package:cakeke/blocs/sign_up/sign_up_state.dart';
import 'package:cakeke/data/models/common/sign_user.dart';
import 'package:cakeke/data/providers/sign_in_provider.dart';
import 'package:cakeke/data/providers/sign_up_provider.dart';
import 'package:cakeke/data/providers/user_provider.dart';
import 'package:cakeke/data/repositories/sign_in_repository.dart';
import 'package:cakeke/data/repositories/sign_up_repository.dart';
import 'package:cakeke/data/repositories/user_repository.dart';
import 'package:cakeke/data/source/local/prefs.dart';
import 'package:cakeke/data/source/local/storage.dart';
import 'package:cakeke/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState(user: SignUser())) {
    on<IdDuplicationCheck>(_handleDuplicationIdCheckEvent);
    on<IdChangedEvent>(_handleIdChangedEvent);
    on<ButtonTapEvent>(_handleButtonTapEvent);
    on<PasswordChangedEvent>(_handlePasswordChangedEvent);
    on<CheckPasswordChangedEvent>(_handlePasswordCheckEvent);
    on<PurposeChangedEvent>(_handlePurposeChangedEvent);
    on<ProfileIdChangedEvent>(_handleProfileIdChangedEvent);
    on<BirthChangedEvent>(_handleBirthChangedEvent);
    on<SexChangedEvent>(_handleSexChangedEvent);
    on<SignUpProgressEvent>(_handleSignUpProgressEvent);
  }

  final SignUpRepository repository =
      SignUpRepository(signUpProvider: SignUpProvider());

  Future<void> _handleSignUpProgressEvent(
    SignUpProgressEvent event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      final user = state.user;

      final isComplete = await repository.signUp(
        userId: user.userId,
        age: user.age,
        sex: user.sex,
        password: user.password,
        image: user.image,
        checkPassword: state.checkPassword,
        servicePurpose: user.servicePurpose,
      );

      if (isComplete) {
        await SignInRepository(signinProvider: SignInProvider())
            .signin(id: user.userId, password: state.password);

        final userInfo =
            await UserRepository(userProvider: UserProvider()).getUser();
        Storage.write(Storage.uid, '${userInfo.id}');
        Prefs.setString(Prefs.profileFileName, user.image);
        Prefs.setString(Prefs.name, userInfo.name);
        emit(state.copyWith(name: userInfo.name, chapter: state.chapter + 1));
      } else {
        Utils.showSnackBar(event.context, '회원가입에 실패하였습니다.');
      }
    } catch (e) {
      Utils.showSnackBar(event.context, '회원가입 중 오류가 발생하였습니다.');
    }
  }

  Future<void> _handleDuplicationIdCheckEvent(
    IdDuplicationCheck event,
    Emitter<SignUpState> emit,
  ) async {
    final isDuplication = await repository.checkIdDuplicate(state.user.userId);

    if (isDuplication && event.context.mounted) {
      Utils.showSnackBar(event.context, '중복되는 아이디 입니다.');
    }

    bool isValidId = Utils.validateId(state.user.userId);

    if (isValidId == false && event.context.mounted) {
      Utils.showSnackBar(event.context, '영문, 숫자 포함 8자리 이상 입력해주세요.');
    }

    emit(state.copyWith(
        isDuplicationId: !isValidId ? null : isDuplication,
        isButtonActive: isValidId && isDuplication == false));
  }

  Future<void> _handleButtonTapEvent(
    ButtonTapEvent event,
    Emitter<SignUpState> emit,
  ) async {
    if (event.isNextPurposeLevel) {
      final result = await repository.getServicePurpose();
      emit(state.copyWith(purpose: result));
    }

    emit(state.copyWith(isButtonActive: false, chapter: state.chapter + 1));
  }

  void _handleIdChangedEvent(
    IdChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    bool isValidId = Utils.validateId(event.id);

    emit(state.copyWith(
        user: state.user.copyWith(userId: event.id),
        isValidId: isValidId,
        isButtonActive: false));
  }

  void _handlePasswordChangedEvent(
    PasswordChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    final password = event.password;
    emit(state.copyWith(
        user: state.user.copyWith(password: password),
        password: password,
        isButtonActive: password.length > 5));
  }

  void _handlePasswordCheckEvent(
    CheckPasswordChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    final password = event.checkPassword;
    final isMatch = password == state.password;
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
          isButtonActive: event.birth.length > 5 && state.user.sex.isNotEmpty));
    } else {
      emit(state.copyWith(
        user: state.user.copyWith(age: 0),
      ));
    }
  }

  void _handleSexChangedEvent(
    SexChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    final sex = (event.sex == "2" || event.sex == "4") ? "여성" : "남성";
    emit(state.copyWith(
        user: state.user.copyWith(sex: sex),
        isButtonActive: state.user.age != 0 && event.sex.isNotEmpty));
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
