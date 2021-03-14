import 'package:flutter/material.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:frontend/view/widget/login_box/content/login_content.dart';

class LoginMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      child: SingleChildScrollView(
        child: LoginContent(
          height: height,
        ),
      ),
    );
  }
}
