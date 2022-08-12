import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/buttons/main_button.dart';
import '../../../widgets/appbar.dart';
import '../../widgets/buttons/back_button.dart';
import '../../widgets/buttons/text_button.dart';
import '../../resources/theme/custom_theme.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
           const CustomBackButton(),
          Text("Enter Verification Code",
              style: CustomTheme.lightTheme.textTheme.headline1),
          Text(
              "Enter code that we have sent to your email yon*******@gmail.com",
              style: CustomTheme.lightTheme.textTheme.bodyText1),
          MainButtonDark(
              name: "Verify",
              onPressed: () {
                Navigator.pushNamed(context, '/createPassword');
              }),
          Center(
              child: RegularTextButton(onPressed: () {}, name: "Resend Code")),
        ]),
      ),
    );
  }
}
