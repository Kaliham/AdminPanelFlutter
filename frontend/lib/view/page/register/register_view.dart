import 'package:flutter/material.dart';
import 'package:frontend/view/page/register/register_desktop.dart';
import 'package:frontend/view/page/register/register_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: RegisterMobile(),
        tablet: RegisterDesktop(),
      ),
    );
  }
}
