import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:frontend/services/account_service.dart';
import 'package:frontend/services/locator.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:frontend/view/widget/buttons/default_button.dart';
import 'package:frontend/view/widget/input_field/default_inputfield.dart';

class ProfileBoxContent extends StatelessWidget {
  final TextEditingController emailTec = TextEditingController(),
      passwordTec = TextEditingController(),
      confirmPasswordTec = TextEditingController(),
      newpasswordTec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: height / 7,
          child: Center(
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 43,
                color: kBiscay,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Text(
          "Email: ${getIt.get<PreferenceService>().email}",
          style: kTextStyle,
        ),
        SizedBox(
          height: 20,
        ),
        DefaultInputField(
          textEditingController: passwordTec,
          hintText: "Password",
          labelText: "Password",
          obsecureText: true,
          textInputType: TextInputType.visiblePassword,
        ),
        DefaultInputField(
          textEditingController: confirmPasswordTec,
          hintText: "New password",
          labelText: "New Password",
          textInputType: TextInputType.visiblePassword,
          obsecureText: true,
        ),
        DefaultInputField(
          textEditingController: newpasswordTec,
          hintText: "Confirm new password",
          labelText: "Confirm new Password",
          textInputType: TextInputType.visiblePassword,
          obsecureText: true,
        ),
        Container(
          width: 360,
          child: DefaultButton(
            onPressed: () async {
              String response = await getIt
                  .get<AccountService>()
                  .changePassword(passwordTec.text, confirmPasswordTec.text,
                      newpasswordTec.text);

              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(response)));
            },
          ),
        ),
      ],
    );
  }
}
