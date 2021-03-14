import 'package:flutter/material.dart';
import 'package:frontend/view/page/login/login_desktop.dart';
import 'package:frontend/view/page/login/login_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: LoginMobile(),
        tablet: LoginDesktop(),
      ),
    );
  }
}
