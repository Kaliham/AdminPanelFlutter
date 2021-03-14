import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/ui_constants.dart';

class DefaultButton extends StatelessWidget {
  final double height;
  final String text;
  final Function onPressed;
  final Color color;
  DefaultButton(
      {this.height = 40,
      this.text = "Login",
      this.onPressed,
      this.color = kSoftBlue});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
      ),
      width: double.infinity,
      margin: EdgeInsets.all(20),
      height: 40,
      child: ElevatedButton(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
        ),
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) => color),
        ),
      ),
    );
  }
}
