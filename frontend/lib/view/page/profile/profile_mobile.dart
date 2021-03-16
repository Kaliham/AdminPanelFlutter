import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/services/locator.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:frontend/view/widget/box_mobile/box_mobile.dart';
import 'package:frontend/view/widget/complaint_box/complaint_box_mobile.dart';
import 'package:frontend/view/widget/complaint_list/complaint_list.dart';
import 'package:frontend/view/widget/mobile_bar/mobile_appbar.dart';
import 'package:frontend/view/widget/mobile_bar/mobile_drawer.dart';
import 'package:frontend/view/widget/profile_box/profile_box_admin_content.dart';
import 'package:frontend/view/widget/profile_box/profile_box_content.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileViewMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      endDrawerEnableOpenDragGesture: false,
      drawer: MobileDrawer(),
      appBar: MobileAppBar.bar(context, _drawerKey),
      body: Container(
        decoration: BoxDecoration(gradient: kGradient),
        child: BoxMobile(
          child: (getIt.get<PreferenceService>().isAdmin)
              ? ProfileBoxAdminContent()
              : ProfileBoxContent(),
        ),
      ),
    );
  }
}
