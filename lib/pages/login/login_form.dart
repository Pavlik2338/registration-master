import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/localization/english_localization.dart';

import '../../blocs/login/bloc/login_bloc.dart';
import '../../resources/validators/validators.dart';

import '../../widgets/buttons/main_button.dart';
import '../../widgets/buttons/text_button.dart';
import '../../widgets/textfields/secured_textfield.dart';
import '../../widgets/textfields/unsecured_textfield.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginFormWidgetState();
}

class LoginFormWidgetState extends State<LoginFormWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKeyUsername = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24.h,
      children: [
        Form(
          key: _formKeyUsername,
          child: UnsecuredTextField(
            validator: (text) => Validators().validateUsername(text),
            controller: _emailController,
            onChanged: (String str) {},
            errorText: null,
            nameField: Localization.username,
          ),
        ),
        Form(
          key: _formKeyPassword,
          child: SecuredTextField(
            validator: (text) => Validators().validatePassword(text),
            controller: _passwordController,
            onChanged: (String str) {},
            nameField: Localization.password,
            errorText: null,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: RegularTextButton(
            name: Localization.forgot,
            onPressed: () {
              Navigator.pushNamed(context, '/forgotPassword');
            },
          ),
        ),
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              Navigator.pushNamed(context, '/splash');
            }
            if (state is LoginFailedState) {
              final snackBar = SnackBar(
                content: const Text(
                    Localization.passwordNotMatch),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pushNamed(context, '/login');
            }
            if (state is LoginSuccessState) {
              Navigator.pushNamed(context, '/home');
            }
          },
          child: MainButtonLight(
              name: "Login",
              onPressed: () {
                if (_formKeyUsername.currentState!.validate() &
                    _formKeyPassword.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginSubmitted(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim()));
                }
              }),
        ),
      ],
    );
  }
}
