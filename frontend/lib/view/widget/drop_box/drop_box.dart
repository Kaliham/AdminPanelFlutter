import 'package:flutter/material.dart';

class DropBox extends StatefulWidget {
  Function function;
  Map<String, dynamic> data;
  String text;
  var value;
  DropBox({this.function, this.data, this.text, this.value = ""});
  @override
  _DropBoxState createState() => _DropBoxState();
}

class _DropBoxState extends State<DropBox> {
  var stateValue;
  @override
  void initState() {
    super.initState();
    stateValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Container(
            width: 400,
            child: DropdownButton(
              isExpanded: true,
              items: _buildTypeItems(),
              value: stateValue,
              onChanged: (value) {
                setState(() {
                  widget.function(value);
                  stateValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<dynamic>> _buildTypeItems() {
    return widget.data.entries.map((mapEntry) {
      return DropdownMenuItem(
        child: Center(
            child: Text(
          mapEntry.key,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        )),
        value: mapEntry.value,
      );
    }).toList();
  }
}
