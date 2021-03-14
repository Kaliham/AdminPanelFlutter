import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';

class TextLink extends StatelessWidget {
  final String text, linkText;
  final Function onTap;
  TextLink({
    this.text = "-empty-",
    this.linkText = "link",
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: kPencilLead,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            child: Text(
              linkText,
              style: TextStyle(
                color: kSoftBlue,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
