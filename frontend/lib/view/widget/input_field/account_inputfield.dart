import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:frontend/view/widget/input_field/default_inputfield.dart';

class AccountInputfield extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultInputField(),
        Text("Enter name"),
      ],
    );
  }
}
