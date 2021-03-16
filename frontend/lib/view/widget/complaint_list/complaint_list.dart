import 'package:flutter/material.dart';
import 'package:frontend/model/complaints.dart';
import 'package:frontend/services/account_service.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/services/locator.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:frontend/view/page/edit/edit_view.dart';
import 'package:frontend/view/widget/complaint_list/comaplaint_list_item.dart';

class ComplaintList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Complaint>>(
      future: ((getIt.get<PreferenceService>().isAdmin)
          ? getIt.get<ApiService>().getAllComplaints()
          : getIt.get<ApiService>().getComplaints()),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        print(snapshot.data.length);
        return Container(
          child: ListView.separated(
            separatorBuilder: (context, ind) {
              return Divider();
            },
            itemBuilder: (context, ind) {
              if (getIt.get<PreferenceService>().isAdmin)
                return ComplaintListItem(
                  complaint: snapshot.data[ind],
                  onTap: () {
                    Navigator.pushNamed(context, "/edit",
                        arguments: snapshot.data[ind]);
                  },
                  statusOnTap: () {},
                );
              return ComplaintListItem(
                complaint: snapshot.data[ind],
                onTap: () {
                  Navigator.pushNamed(context, "/view",
                      arguments: snapshot.data[ind]);
                },
                statusOnTap: () {},
              );
            },
            itemCount: snapshot.data.length,
          ),
        );
      },
    );
  }
}
