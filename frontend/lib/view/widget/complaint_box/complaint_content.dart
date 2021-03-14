import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/text_constants.dart';
import 'package:frontend/view/widget/complaint_list/complaint_list.dart';

class ComplaintContent extends StatelessWidget {
  final double bottomPadding;
  ComplaintContent({this.bottomPadding = 0});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 90,
            child: Text(
              kComplaints,
              style: TextStyle(
                  color: kPencilLead,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: ComplaintList()),
          SizedBox(
            height: bottomPadding,
          )
        ],
      ),
    );
  }
}
