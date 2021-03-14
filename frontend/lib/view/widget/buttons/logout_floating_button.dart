import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/services/account_service.dart';
import 'package:get_it/get_it.dart';

class LogoutFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          backgroundColor: kSoftBlue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
          child: Icon(Icons.add_box_outlined),
          onPressed: () {
            Navigator.pushNamed(context, "/add");
          },
        ),
        SizedBox(
          width: 20,
        ),
        FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
          child: Icon(Icons.exit_to_app),
          onPressed: () {
            GetIt.I.get<AccountService>().logout();
            Navigator.pushNamed(context, "/login");
          },
        ),
      ],
    );
  }
}
