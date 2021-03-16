import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/services/account_service.dart';
import 'package:frontend/view/widget/buttons/default_button.dart';
import 'package:frontend/view/widget/input_field/default_inputfield.dart';
import 'package:frontend/view/widget/links/text_link.dart';
import 'package:get_it/get_it.dart';

class RegisterContent extends StatelessWidget {
  final TextEditingController emailTec = TextEditingController(),
      confirmEmailTec = TextEditingController(),
      passwordTec = TextEditingController(),
      confirmPasswordTec = TextEditingController();
  final double height, width, spacing;
  RegisterContent({
    Key key,
    this.spacing = 10,
    this.height,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: height / 6,
            child: Center(
              child: Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 43,
                  color: kBiscay,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultInputField(
                    textEditingController: emailTec,
                    hintText: "e.g. email@example.com",
                    labelText: "Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: spacing,
                  ),
                  DefaultInputField(
                    textEditingController: confirmEmailTec,
                    hintText: "e.g. email@example.com",
                    labelText: "Confirm Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: spacing,
                  ),
                  DefaultInputField(
                    textEditingController: passwordTec,
                    hintText: "password",
                    labelText: "Password",
                    textInputType: TextInputType.visiblePassword,
                    obsecureText: true,
                  ),
                  SizedBox(
                    height: spacing,
                  ),
                  DefaultInputField(
                    textEditingController: confirmPasswordTec,
                    hintText: "Confirm password",
                    labelText: "Confirm Password",
                    textInputType: TextInputType.visiblePassword,
                    obsecureText: true,
                  ),
                ],
              ),
            ),
          ),
          DefaultButton(
            text: "create account",
            onPressed: () async {
              bool success = await GetIt.I.get<AccountService>().register(
                  emailTec.text,
                  passwordTec.text,
                  confirmEmailTec.text,
                  confirmPasswordTec.text);
              print(success);
              if (success) {
                Navigator.pushNamed(context, "/");
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Credential failed")));
              }
            },
          ),
          SizedBox(
            height: spacing,
          ),
          TextLink(
            text: "already have an account?",
            linkText: "login",
            onTap: () {
              // final snackBar = SnackBar(
              //   content: Text('Yay! A SnackBar!'),
              //   action: SnackBarAction(
              //     label: "wow",
              //     onPressed: () {},
              //   ),
              // );
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pushNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
