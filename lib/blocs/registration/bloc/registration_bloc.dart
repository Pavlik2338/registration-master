import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:registration/repositories/abstract_repository.dart';
import '../../../models/user_model.dart';


part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AbstractRepository repository;
  RegistrationBloc({
    required this.repository,
  }) : super(RegistrationInitialState()) {
    on<RegistrationSubmitted>(_onSubmitted);
  }

  void _onSubmitted(
    RegistrationSubmitted event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(RegistrationLoadingState());
    UserModel user = await repository.signUp(
        email: event.email, password: event.password, userName: event.username);
    if (user.statusRegistered == StateUserRegistered.isRegistered) {
      emit(RegistrationSuccessState());
    } else {
      emit(RegistrationFailedState());
    }
  }
}
