import 'package:cakeke/blocs/sign_in/sign_in_event.dart';
import 'package:cakeke/blocs/sign_in/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {}
}
