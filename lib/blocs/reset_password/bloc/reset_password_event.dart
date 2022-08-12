part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object> get props => [];
}

class EmailForResetSubmitted extends ResetPasswordEvent {
  final String email;
  const EmailForResetSubmitted({required this.email});
}
