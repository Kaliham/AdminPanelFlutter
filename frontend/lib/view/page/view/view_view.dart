import 'package:flutter/material.dart';
import 'package:frontend/model/complaints.dart';
import 'package:frontend/services/locator.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:frontend/view/widget/complaint_edit_box/complaint_edit_box.dart';
import 'package:frontend/view/widget/complaint_view_box/complaint_view_box.dart';

class ViewView extends StatelessWidget {
  final Complaint complaint;
  ViewView(this.complaint);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ComplaintViewBox(
        complaint: complaint,
      ),
    );
  }
}
