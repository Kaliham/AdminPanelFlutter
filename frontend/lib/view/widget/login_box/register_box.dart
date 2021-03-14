import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/view/widget/buttons/default_button.dart';
import 'package:frontend/view/widget/input_field/account_inputfield.dart';
import 'package:frontend/view/widget/input_field/default_inputfield.dart';
import 'package:frontend/view/widget/links/text_link.dart';
import 'package:frontend/view/widget/login_box/account_box.dart';
import 'package:frontend/view/widget/login_box/content/register_content.dart';

class RegisterBox extends StatelessWidget {
  final double width, height;
  final TextEditingController emailTec,
      confirmEmailTec,
      passwordTec,
      confirmPasswordTec;
  RegisterBox(
      {Key key,
      this.width,
      this.height,
      this.emailTec,
      this.confirmEmailTec,
      this.confirmPasswordTec,
      this.passwordTec})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height * 0.8;
    double w = MediaQuery.of(context).size.width * 0.40;
    w = max(w, 380);
    return AccountBox(
      height: h,
      width: w,
      child: Center(
          child: RegisterContent(
        confirmEmailTec: confirmEmailTec,
        emailTec: emailTec,
        passwordTec: passwordTec,
        height: h,
        confirmPasswordTec: confirmPasswordTec,
      )),
    );
  }
}
