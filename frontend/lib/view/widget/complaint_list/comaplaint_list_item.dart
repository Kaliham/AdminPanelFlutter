import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';

class ComplaintListItem extends StatelessWidget {
  final String title, subtitle, description, status;
  final Function onTap, statusOnTap;
  ComplaintListItem({
    this.statusOnTap,
    this.onTap,
    this.title = "-empty text-",
    this.subtitle = "-empty text-",
    this.description = "-empty text-",
    this.status = "-empty text-",
  });
  Color get statusColor => kFlamingoPink;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListTile(
      hoverColor: kBiscay.withAlpha(30),
      onTap: onTap,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: min(3 * width / 4, 380),
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: kSoftBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: TextStyle(color: kBiscay, fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  child: Text(
                    status,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 20,
                    ),
                  ),
                  onTap: statusOnTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
