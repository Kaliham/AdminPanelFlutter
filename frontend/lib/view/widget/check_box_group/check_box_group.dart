import 'package:flutter/material.dart';

class CheckBoxGroup extends StatefulWidget {
  Function function;
  CheckBoxGroup({this.function});
  @override
  _CheckBoxGroupState createState() => _CheckBoxGroupState();
}

class _CheckBoxGroupState extends State<CheckBoxGroup> {
  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        children: [
          _buildItem("ios"),
          _buildItem("android"),
          _buildItem("web"),
        ],
      ),
    );
  }

  Widget _buildItem(String text) {
    return CheckboxListTile(
      value: (list.contains(text)),
      title: Text(text),
      onChanged: (value) {
        if (value) {
          setState(() {
            list.add(text);
            widget.function(list);
          });
        } else {
          setState(() {
            list.remove(text);
            widget.function(list);
          });
        }
      },
    );
  }
}
