import 'package:flutter/material.dart';
import 'package:frontend/constants/ui_constants.dart';

class AccountBox extends StatelessWidget {
  final Widget child;
  final double width, height;
  const AccountBox({Key key, this.child, this.height, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: kBoxShadow,
      ),
      child: child,
    );
  }
}
