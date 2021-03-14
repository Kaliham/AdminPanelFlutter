import 'package:flutter/material.dart';
import 'package:frontend/view/page/add/add_view.dart';
import 'package:frontend/view/page/home/home_view_desktop.dart';
import 'package:frontend/view/page/home/home_view_mobile.dart';
import 'package:frontend/view/widget/complaint_list/complaint_list.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeViewMobile(),
      desktop: HomeViewDesktop(),
    );
    // return Container(
    //   color: Colors.white,
    //   child: Center(
    //     child: RegisterBox(
    //       height: 720,
    //       width: 340,
    //     ),
    //   ),
    // );
    // return AddView();
  }
}
