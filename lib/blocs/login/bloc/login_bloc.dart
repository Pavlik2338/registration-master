import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/models/user_model.dart';
import 'package:registration/repositories/login_google_repository.dart';

import '../../../repositories/abstract_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AbstractRepository repository;
  final LoginGoogleRepository loginGoogle;
  LoginBloc({
    required this.loginGoogle,
    required this.repository,
  }) : super(LoginInitialState()) {
    on<LoginSubmitted>(_onSubmitted);
    on<LoginGoogleClick>(_onClickGoogleButton);
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());
    UserModel user =
        await repository.signIn(email: event.email, password: event.password);
    if (user.statusLogged == StateUserLogged.isLogged) {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailedState());
    }
  }

  void _onClickGoogleButton(
    LoginGoogleClick event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());
    bool isSuccess = await loginGoogle.signIn();
    if (isSuccess) {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailedState());
    }
  }
}
