import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/text_constants.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:frontend/view/widget/complaint_box/complaint_content.dart';
import 'package:frontend/view/widget/complaint_list/complaint_list.dart';

class ComplaintBoxMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 20, left: 20),
      decoration: BoxDecoration(boxShadow: kBoxShadow),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(120), topRight: Radius.circular(120)),
        child: ComplaintContent(),
      ),
    );
  }
}
