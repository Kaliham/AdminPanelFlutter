import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/text_constants.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileAppBar {
  static PreferredSizeWidget bar(
      BuildContext context, GlobalKey<ScaffoldState> _drawerKey) {
    return AppBar(
      iconTheme: IconThemeData(color: kCornFlower),
      title: Center(
        child: Text(
          kSiteTitle,
          style: kTitleTextStyle,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.view_headline_rounded,
          color: kCornFlower,
        ),
        iconSize: 34,
        onPressed: () {
          _drawerKey.currentState.openDrawer();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.add_box_outlined,
            color: kBlueCuracao,
          ),
          iconSize: 34,
          onPressed: () {
            Navigator.pushNamed(context, "/add");
          },
        )
      ],
    );
  }
}
