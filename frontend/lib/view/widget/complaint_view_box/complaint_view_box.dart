import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:frontend/model/complaints.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/view/widget/buttons/default_button.dart';
import 'package:frontend/view/widget/check_box_group/check_box_group.dart';
import 'package:frontend/view/widget/drop_box/drop_box.dart';
import 'package:frontend/view/widget/input_field/default_inputfield.dart';
import 'package:frontend/view/widget/radio_group/radio_group.dart';
import 'package:get_it/get_it.dart';

class ComplaintViewBox extends StatelessWidget {
  Complaint complaint;
  ComplaintViewBox({this.complaint});
  @override
  Widget build(BuildContext context) {
    if (complaint == null) {
      Navigator.pushNamed(context, "/");
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    double width = MediaQuery.of(context).size.width;
    String platforms = "";
    bool flag = false;
    for (String platform in complaint.platforms) {
      print(platform);
      if (flag) platforms += ",";
      platforms += platform;
      flag = true;
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: kBoxShadow,
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Edit Status",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              Text("title:${complaint.title}", style: kTextStyle),
              Text("Description:${complaint.description}", style: kTextStyle),
              Text("Type:${complaint.description}", style: kTextStyle),
              Text("Gender:${complaint.gender}", style: kTextStyle),
              Text("Occurrence:${complaint.occurrence}", style: kTextStyle),
              Text("plaforms:${platforms}", style: kTextStyle),
              Text(
                "Status:${complaint.status}",
                style: kTextStyle,
              ),
              Container(
                width: 360,
                child: DefaultButton(
                  text: "Close",
                  onPressed: () => onPressed(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressed(BuildContext context) {
    Navigator.pushNamed(context, "/");
  }
}
