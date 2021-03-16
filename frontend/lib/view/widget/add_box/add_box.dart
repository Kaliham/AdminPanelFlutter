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

class AddBox extends StatelessWidget {
  String type, gender;
  int occurrence = 0;
  Complaint complaint = new Complaint(occurrence: 0, platforms: []);
  TextEditingController titleTec = new TextEditingController(),
      descriptionTec = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
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
              "Title",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Container(
              width: max(width / 4, 420),
              child: DefaultInputField(
                textEditingController: titleTec,
                labelText: "title",
                hintText: "title",
              ),
            ),
            Text(
              "description",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Container(
              width: max(width / 4, 420),
              child: DefaultInputField(
                textEditingController: descriptionTec,
                labelText: "Description",
                hintText: "description",
              ),
            ),
            _buildType(),
            _buildGender(),
            RadioGroup(
              function: setOccurrence,
            ),
            CheckBoxGroup(
              function: setPlatforms,
            ),
            Container(
              width: 360,
              child: DefaultButton(
                text: "Submit",
                onPressed: () => onPressed(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed(BuildContext context) async {
    complaint.title = titleTec.text;
    complaint.description = descriptionTec.text;
    if (complaint.title.isNotEmpty &&
        complaint.description.isNotEmpty &&
        complaint.type.isNotEmpty &&
        complaint.gender.isNotEmpty) {
      String reply = await GetIt.I.get<ApiService>().submitComplaint(complaint);
      if (reply == "success") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Successfully added!")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Something went wrong!")));
      }
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Enter empty fields!")));
    }
  }

  void setOccurrence(value) {
    complaint.occurrence = value;
    print(occurrence);
  }

  void setPlatforms(value) {
    complaint.platforms = value;
  }

  void setType(value) {
    complaint.type = value;
  }

  void setGender(value) {
    complaint.gender = value;
  }

  Widget _buildType() {
    return DropBox(
      data: {"error": "error", "issue": "issue", "feedback": "feedback"},
      function: setType,
      text: "Type:",
    );
  }

  Widget _buildGender() {
    return DropBox(
      data: {"Male": "M", "Female": "F", "Other": "O"},
      function: setGender,
      text: "Gender:",
    );
  }
}
