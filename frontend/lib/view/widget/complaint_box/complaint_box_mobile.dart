import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/text_constants.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:frontend/view/widget/box_mobile/box_mobile.dart';
import 'package:frontend/view/widget/complaint_box/complaint_content.dart';
import 'package:frontend/view/widget/complaint_list/complaint_list.dart';

class ComplaintBoxMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoxMobile(
      child: ComplaintContent(),
    );
  }
}
