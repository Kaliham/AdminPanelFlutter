import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/model/complaints.dart';
import 'package:frontend/services/locator.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:frontend/view/widget/complaint_edit_box/complaint_edit_box.dart';

class EditView extends StatelessWidget {
  final Complaint complaint;
  EditView(this.complaint);
  @override
  Widget build(BuildContext context) {
    if (!getIt.get<PreferenceService>().isAdmin)
      Navigator.pushNamed(context, '/');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: FloatingActionButton(
          elevation: 0,
          child: Icon(
            Icons.close,
            color: kBiscay,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.white,
          disabledElevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ComplaintEditBox(
          complaint: complaint,
        ),
      ),
    );
  }
}
