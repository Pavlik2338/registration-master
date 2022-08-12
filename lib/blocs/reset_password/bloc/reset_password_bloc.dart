import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/user_model.dart';
import '../../../repositories/abstract_repository.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AbstractRepository repository;
  ResetPasswordBloc({
    required this.repository,
  }) : super(ResetPasswordInitialState()) {
    on<EmailForResetSubmitted>(_onEmailForResetSubmitted);
  }

  void _onEmailForResetSubmitted(
    EmailForResetSubmitted event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(ResetPasswordLoadingState());
    UserModel user = await repository.resetPassword(email: event.email);
    if (user.emailSent) {
      emit(EmailSuccessState());
    } else {
      emit(EmailFailedState());
    }
  }
}
