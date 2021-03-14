import 'dart:html';

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/text_constants.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:frontend/view/widget/buttons/logout_floating_button.dart';
import 'package:frontend/view/widget/complaint_box/complain_box_desktop.dart';
import 'package:frontend/view/widget/desktop_bar/side_bar.dart';
import 'package:frontend/view/widget/mobile_bar/mobile_appbar.dart';

class HomeViewDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: kGradient),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: LogoutFloatingButton(),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SideBar(
            child: ComplaintBoxDesktop(),
            items: buildItems(context),
          ),
        ),
      ),
    );
  }

  List<CollapsibleItem> buildItems(BuildContext context) {
    return [
      CollapsibleItem(
        text: kComplaints,
        icon: kComplaintsIcon,
        onPressed: () {
          Navigator.pushNamed(context, "/");
        },
        isSelected: true,
      ),
      CollapsibleItem(
        text: kProfile,
        icon: kProfileIcon,
        onPressed: () {
          Navigator.pushNamed(context, "/profile");
        },
      ),
    ];
  }
}
