import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/model/account.dart';
import 'package:frontend/services/account_service.dart';
import 'package:frontend/view/page/register/register_view.dart';
import 'package:frontend/view/widget/buttons/default_button.dart';
import 'package:frontend/view/widget/input_field/default_inputfield.dart';
import 'package:frontend/view/widget/links/text_link.dart';
import 'package:get_it/get_it.dart';

class LoginContent extends StatelessWidget {
  final TextEditingController emailTec, passwordTec;
  final double height;
  LoginContent({this.emailTec, this.passwordTec, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: height / 3,
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
          DefaultInputField(
            textEditingController: emailTec,
            hintText: "e.g. email@example.com",
            labelText: "Email",
          ),
          SizedBox(
            height: 20,
          ),
          DefaultInputField(
            textEditingController: passwordTec,
            hintText: "password",
            labelText: "Password",
          ),
          DefaultButton(
            onPressed: () async {
              bool success = await GetIt.I
                  .get<AccountService>()
                  .login(emailTec.text, passwordTec.text);
              if (success) {
                Navigator.pushNamed(context, "/");
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Credential failed")));
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextLink(
            text: "don't have an account?",
            linkText: "create account",
            onTap: () {
              // final snackBar = SnackBar(
              //   content: Text('Yay! A SnackBar!'),
              //   action: SnackBarAction(
              //     label: "wow",
              //     onPressed: () {},
              //   ),
              // );
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pushNamed(context, "/register");
            },
          ),
        ],
      ),
    );
  }
}
