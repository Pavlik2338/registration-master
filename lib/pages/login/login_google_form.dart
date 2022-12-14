import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/resources/constants/path_images.dart';
import 'package:registration/resources/localization/english_localization.dart';
import 'package:registration/widgets/buttons/google_button.dart';

import '../../blocs/login/bloc/login_bloc.dart';

class LoginGoogleWidget extends StatelessWidget {
  const LoginGoogleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailedState) {}
          if (state is LoginSuccessState) {
            Navigator.pushNamed(context, '/home');
          }
        },
        child: NetworkButton(
          image: Image.asset(PathImages.google ),
          title: Localization.googleSingIn,
          onPressed: () =>
              context.read<LoginBloc>().add(const LoginGoogleClick()),
        ));
  }
}
