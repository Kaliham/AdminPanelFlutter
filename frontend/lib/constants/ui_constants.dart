import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';

// const List<BoxShadow> kBoxShadow = [
//   BoxShadow(color: Color(0x21596275), blurRadius: 20,),
// ];
const Color kShadowColor = Color(0x21596275);
const List<BoxShadow> kBoxShadow = [
  BoxShadow(color: kShadowColor, blurRadius: 32, offset: Offset(10, 10)),
];

BorderRadius kBorderRadius = BorderRadius.circular(20);

double kAccountHeightFactor = 0.8;
double kAccountWidthFactor = 0.40;
double kAccountWidthMin = 380;
IconData kComplaintsIcon = Icons.list_rounded;
IconData kProfileIcon = Icons.account_box_rounded;
TextStyle kTitleTextStyle = GoogleFonts.fascinate(
  color: kBiscay,
  fontSize: 23,
);
