import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/text_constants.dart';
import 'package:frontend/constants/ui_constants.dart';

class SideBar extends StatelessWidget {
  final Widget child;
  final List<CollapsibleItem> items;
  SideBar({@required this.child, @required this.items});
  @override
  Widget build(BuildContext context) {
    return CollapsibleSidebar(
      body: Container(
        child: child,
      ),
      items: items,
      title: kSiteTitle,
      backgroundColor: Colors.white,
      selectedIconColor: Colors.white,
      selectedTextColor: Colors.white,
      unselectedIconColor: kBiscay,
      unselectedTextColor: kBiscay,
      selectedIconBox: kSoftBlue,
      titleStyle: kTitleTextStyle.apply(fontSizeFactor: 0.75),
    );
  }
}
