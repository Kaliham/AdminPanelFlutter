import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_item.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/constants/text_constants.dart';
import 'package:frontend/constants/ui_constants.dart';
import 'package:frontend/services/locator.dart';
import 'package:frontend/services/preference_service.dart';
import 'package:frontend/view/page/profile/profile_desktop.dart';
import 'package:frontend/view/page/profile/profile_mobile.dart';
import 'package:frontend/view/widget/buttons/logout_floating_button.dart';
import 'package:frontend/view/widget/desktop_bar/side_bar.dart';
import 'package:frontend/view/widget/profile_box/profile_box.dart';
import 'package:frontend/view/widget/profile_box/profile_box_admin.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ProfileViewMobile(),
      tablet: ProfileViewDesktop(),
    );
  }
}
