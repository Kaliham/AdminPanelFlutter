import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';

class MobileDrawerItem extends StatelessWidget {
  final Function onTap;
  final String title;
  final IconData icon;
  MobileDrawerItem({
    @required this.onTap,
    @required this.icon,
    @required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildIcon(),
          _buildTitle(),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _buildIcon() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Icon(
        icon,
        size: 32,
        color: kBiscay,
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: kBiscay,
        ),
      ),
    );
  }
}
