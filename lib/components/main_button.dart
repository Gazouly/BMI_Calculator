import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Function onPress;

  MainButton({@required this.title, @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kMainButton,
          ),
        ),
        color: kContainerBackground,
        width: double.infinity,
        height: kContainerHeight,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}
