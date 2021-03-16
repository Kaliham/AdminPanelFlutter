import 'package:flutter/material.dart';
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
    return Container(
      color: Colors.white,
      child: ComplaintEditBox(
        complaint: complaint,
      ),
    );
  }
}
