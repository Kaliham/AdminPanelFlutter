import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/view/widget/login_box/login_box.dart';
import 'package:frontend/view/widget/login_box/register_box.dart';

class RegisterDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: kGradient),
      child: Center(
        child: RegisterBox(
          height: 720,
          width: 340,
        ),
      ),
    );
  }
}
