import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/main_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';

class ResultsView extends StatelessWidget {
  final String bmi;
  final String label;
  final String message;
  ResultsView(
      {@required this.bmi, @required this.label, @required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: kResultHead,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardBG: kActiveCardBackground,
              cardChild: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      label.toUpperCase(),
                      style: kResultLabel,
                    ),
                    Text(
                      bmi,
                      style: kResultNumber,
                    ),
                    Text(
                      message,
                      style: kResultBody,
                      textAlign: TextAlign.center,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Center(
                          child: Text(
                        'Save Result',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 20,
                          color: Color(0xFFFFFFFF),
                        ),
                      )),
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                      color: kInactiveCardBackground,
                    ),
                  ],
                ),
              ),
            ),
          ),
          MainButton(
            title: 'RE-CALCULATE YOUR BMI',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
