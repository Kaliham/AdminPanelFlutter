import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/text_constants.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:frontend/view/widget/buttons/logout_button.dart';
import 'package:frontend/view/widget/mobile_bar/mobile_drawer_item.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          child: Column(
            // Important: Remove any padding from the ListView.
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildDrawerHeader(),
              MobileDrawerItem(
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
                icon: kComplaintsIcon,
                title: kComplaints,
              ),
              MobileDrawerItem(
                onTap: () {
                  Navigator.pushNamed(context, "/profile");
                },
                icon: kProfileIcon,
                title: kProfile,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LogoutButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      width: double.infinity,
      child: DrawerHeader(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: kCornFlower,
          gradient: kGradient,
        ),
        child: Center(
          child: Text(
            kSiteTitle,
            style: kTitleTextStyle.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
