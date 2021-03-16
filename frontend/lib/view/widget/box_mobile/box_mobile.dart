import 'package:flutter/material.dart';
import 'package:frontend/constants/ui_constants.dart';

class BoxMobile extends StatelessWidget {
  final Widget child;
  BoxMobile({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 20, left: 20),
      decoration: BoxDecoration(boxShadow: kBoxShadow),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(120), topRight: Radius.circular(120)),
        child: Container(
          color: Colors.white,
          child: child,
        ),
      ),
    );
  }
}
