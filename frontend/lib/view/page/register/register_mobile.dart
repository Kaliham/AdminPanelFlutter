import 'package:flutter/material.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:frontend/view/widget/login_box/content/login_content.dart';
import 'package:frontend/view/widget/login_box/content/register_content.dart';

class RegisterMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      child: SingleChildScrollView(
        child: RegisterContent(
          height: height,
          spacing: 0,
        ),
      ),
    );
  }
}
