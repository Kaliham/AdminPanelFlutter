import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:frontend/view/widget/buttons/default_button.dart';
import 'package:frontend/view/widget/input_field/account_inputfield.dart';
import 'package:frontend/view/widget/input_field/default_inputfield.dart';
import 'package:frontend/view/widget/links/text_link.dart';
import 'package:frontend/view/widget/login_box/account_box.dart';
import 'package:frontend/view/widget/login_box/content/login_content.dart';

class LoginBox extends StatelessWidget {
  final double width, height;
  final TextEditingController emailTec, passwordTec;
  LoginBox({Key key, this.width, this.height, this.emailTec, this.passwordTec})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height * kAccountHeightFactor;
    double w = MediaQuery.of(context).size.width * kAccountWidthFactor;
    w = max(w, kAccountWidthMin);
    return AccountBox(
      height: h,
      width: w,
      child: Center(
        child: LoginContent(
          height: h,
        ),
      ),
    );
  }
}
