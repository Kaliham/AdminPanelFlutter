import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/text_constants.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:frontend/view/widget/complaint_box/complaint_content.dart';
import 'package:frontend/view/widget/complaint_list/complaint_list.dart';

class ComplaintBoxDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(boxShadow: kBoxShadow),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(120)),
        child: ComplaintContent(
          bottomPadding: 26,
        ),
      ),
    );
  }
}
