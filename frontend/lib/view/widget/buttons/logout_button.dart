import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/services/account_service.dart';
import 'package:get_it/get_it.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: kOldGeranium),
      onPressed: () {
        GetIt.I.get<AccountService>().logout();
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: Text(
          "Logout",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
