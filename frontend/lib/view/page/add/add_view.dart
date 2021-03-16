import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constants.dart';
import 'package:frontend/view/widget/add_box/add_box.dart';

class AddView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: FloatingActionButton(
          elevation: 0,
          child: Icon(
            Icons.close,
            color: kBiscay,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.white,
        ),
      ),
      body: Container(
        child: AddBox(),
      ),
    );
  }
}
