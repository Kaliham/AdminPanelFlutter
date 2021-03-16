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

class ProfileBoxAdminContent extends StatefulWidget {
  @override
  _ProfileBoxAdminContentState createState() => _ProfileBoxAdminContentState();
}

class _ProfileBoxAdminContentState extends State<ProfileBoxAdminContent> {
  final TextEditingController emailTec = TextEditingController();
  bool stateValue = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height / 7,
          child: Center(
            child: Text(
              "Change Account Admin status",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 43,
                color: kBiscay,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          width: 420,
          child: DefaultInputField(
            textEditingController: emailTec,
            hintText: "e.g. email@example.com",
            labelText: "Email",
          ),
        ),
        Container(
          width: width / 4,
          child: CheckboxListTile(
            title: Text(
              "Admin",
              style: style,
            ),
            value: stateValue,
            onChanged: (value) {
              setState(() {
                stateValue = value;
              });
            },
          ),
        ),
        Container(
          width: max(width / 4, 360),
          child: DefaultButton(
            onPressed: () async {
              bool success = await getIt
                  .get<AccountService>()
                  .changeAdminStatus(emailTec.text, stateValue);

              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Account status changed!")));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Something went wrong!")));
              }
            },
          ),
        ),
      ],
    );
  }

  TextStyle get style {
    return TextStyle(fontWeight: FontWeight.w600, fontSize: 18);
  }
}
