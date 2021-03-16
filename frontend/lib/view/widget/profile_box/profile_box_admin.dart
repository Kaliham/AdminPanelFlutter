import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:frontend/services/account_service.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/locator.dart';
import 'package:frontend/view/widget/buttons/default_button.dart';
import 'package:frontend/view/widget/input_field/default_inputfield.dart';
import 'package:frontend/view/widget/profile_box/profile_box_admin_content.dart';

class ProfileBoxAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(
        boxShadow: kBoxShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(120)),
        child: Container(
          color: Colors.white,
          width: width / 2,
          alignment: Alignment.center,
          child: ProfileBoxAdminContent(),
        ),
      ),
    );
  }

  TextStyle get style {
    return TextStyle(fontWeight: FontWeight.w600, fontSize: 18);
  }
}
