import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_item.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/text_constants.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:frontend/services/locator.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:frontend/view/widget/buttons/logout_floating_button.dart';
import 'package:frontend/view/widget/desktop_bar/side_bar.dart';
import 'package:frontend/view/widget/profile_box/profile_box.dart';
import 'package:frontend/view/widget/profile_box/profile_box_admin.dart';

class ProfileViewDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: kGradient),
      child: Scaffold(
        floatingActionButton: LogoutFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SideBar(
            child: (getIt.get<PreferenceService>().isAdmin)
                ? ProfileBoxAdmin()
                : ProfileBox(),
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
      ),
      CollapsibleItem(
        text: kProfile,
        icon: kProfileIcon,
        onPressed: () {
          Navigator.pushNamed(context, "/profile");
        },
        isSelected: true,
      ),
    ];
  }
}
