import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/ui_constants.dart';

class DefaultInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText, labelText;
  final Color color, focusColor, enabledColor, textColor, shadowColor;
  final TextInputType textInputType;
  final bool obsecureText;
  const DefaultInputField({
    Key key,
    this.textEditingController,
    this.color = kBiscay,
    this.hintText = "",
    this.focusColor = kCornFlower,
    this.labelText = "",
    this.textColor = kPencilLead,
    this.shadowColor = kShadowColor,
    this.enabledColor = kSoftBlue,
    this.textInputType = TextInputType.text,
    this.obsecureText = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 20,
            offset: Offset(10, 10),
          ),
        ],
        color: Colors.white,
      ),
      child: TextField(
        controller: textEditingController,
        keyboardType: textInputType,
        obscureText: obsecureText,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          fillColor: kBlueCuracao,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: enabledColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: focusColor, width: 2),
          ),
          hintStyle: TextStyle(color: textColor, fontWeight: FontWeight.w600),
          labelStyle: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
