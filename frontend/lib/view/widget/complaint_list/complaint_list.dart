import 'package:flutter/material.dart';
import 'package:frontend/view/widget/complaint_list/comaplaint_list_item.dart';

class ComplaintList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (context, ind) {
          return Divider();
        },
        itemBuilder: (context, ind) {
          return ComplaintListItem(
            title: "d ads asd asdfsd fasfasdf adf asdfasf",
            subtitle:
                "asdfasdf asdfas fdf asdfasd fasdf asfas fasdfasdfa ds asdfasdf asdfas fdf asdfasd fasdf asfas fasdfasdfa ds",
          );
        },
        itemCount: 10,
      ),
    );
  }
}
