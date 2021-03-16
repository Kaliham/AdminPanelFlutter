import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/view/widget/input_field/default_inputfield.dart';
import 'package:frontend/view/widget/profile_box/profile_box_content.dart';

class ProfileBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      margin: EdgeInsets.all(80),
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(120), color: Colors.white),
      child: ProfileBoxContent(),
    );
  }
}
