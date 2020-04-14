import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class GenderBody extends StatelessWidget {
  final String gender;
  final IconData ico;

  GenderBody({@required this.gender, @required this.ico});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          ico,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(gender, style: kLabelTxtStyle)
      ],
    );
  }
}
