part of 'reset_password_bloc.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitialState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class EmailSuccessState extends ResetPasswordState {}

class EmailFailedState extends ResetPasswordState {}

 