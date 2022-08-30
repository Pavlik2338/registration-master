

import '../resources/constants/enums.dart';

class UserModel {
  String? username;
  String? email;
  String? password;
  StateUserLogged statusLogged = StateUserLogged.unLogged;
  StateUserRegistered statusRegistered = StateUserRegistered.unRegistered;
  bool emailSent = false;
  bool googleSignIn = false;

  UserModel({
    this.username,
    required this.email,
    required this.password,
  });
}

UserModel thisUser = UserModel(username: null, email: null, password: null);
