import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/pages/login/login_form.dart';
import 'package:registration/pages/login/login_google_form.dart';
import 'package:registration/repositories/login_google_repository.dart';
import 'package:registration/resources/localization/english_localization.dart';
import 'package:registration/widgets/buttons/google_button.dart';
import 'package:registration/widgets/login_page_divider.dart';
import '../../../widgets/appbar.dart';
import '../../blocs/login/bloc/login_bloc.dart';
import '../../repositories/login_repository.dart';
import '../../resources/constants/path_images.dart';
import '../../widgets/buttons/text_button.dart';
import '../../resources/theme/custom_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
              repository: LoginRepository(),
              loginGoogle: LoginGoogleRepository());
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(children: [
            SizedBox(
                width: 170.w, height: 170.h, child: Image.asset(PathImages.logoMobyte)),
            const LoginFormWidget(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(Localization.notAccount,
                  style: CustomTheme.lightTheme.textTheme.bodyText1),
              RegularTextButton(
                  name: Localization.singUp,
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  }),
            ]),
            const Padding(
              padding:  EdgeInsets.symmetric(vertical: 12),
              child: LoginPageDivider(),
            ),
            const LoginGoogleWidget(),
             Padding(
               padding: const EdgeInsets.symmetric(vertical:8),
               child: NetworkButton(image:Image.asset(PathImages.apple) , title: Localization.appleSingIn),
             )
          ]),
        ),
      ),
    );
  }
}
