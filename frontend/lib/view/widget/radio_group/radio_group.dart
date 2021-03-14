import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  Function function;
  RadioGroup({this.function});
  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  int _groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Occurrence:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 4,
            child: Column(
              children: [
                // ListTile(
                //   title: const Text('one'),
                //   leading: Radio(
                //     groupValue: _groupValue,
                //     value: 0,
                //     onChanged: (value) {
                //       setState(() {
                //         _groupValue = value;
                //       });
                //     },
                //   ),
                // ),
                _buildRadio("One", 0),
                _buildRadio("2-5", 1),
                _buildRadio("5+", 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadio(
    String text,
    value,
  ) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
      leading: Radio(
        groupValue: _groupValue,
        value: value,
        onChanged: (value) {
          setState(() {
            _groupValue = value;
            widget.function(value);
          });
        },
      ),
      onTap: () {
        setState(() {
          _groupValue = value;
          widget.function(value);
        });
      },
    );
  }
}
