part of 'registration_bloc.dart';

abstract class RegistrationState {}

class RegistrationInitialState extends RegistrationState {}

class RegistrationSuccessState extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationFailedState extends RegistrationState {}
