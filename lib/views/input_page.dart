import 'package:bmi_calculator/components/main_button.dart';
import 'package:bmi_calculator/components/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/gender_body.dart';
import 'package:bmi_calculator/constants.dart';
import 'results_view.dart';

import 'package:bmi_calculator/core/calculate_bmi.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardBG: selectedGender == Gender.male
                          ? kActiveCardBackground
                          : kInactiveCardBackground,
                      cardChild: GenderBody(
                        gender: 'MALE',
                        ico: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardBG: selectedGender == Gender.female
                          ? kActiveCardBackground
                          : kInactiveCardBackground,
                      cardChild: GenderBody(
                        gender: 'FEMALE',
                        ico: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardBG: kActiveCardBackground,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTxtStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kBigTxtStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTxtStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 80.0,
                        max: 220.0,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardBG: kActiveCardBackground,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTxtStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                weight.toString(),
                                style: kBigTxtStyle,
                              ),
                              Text(
                                'kg',
                                style: kLabelTxtStyle,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: RoundIconButton(
                                  onPress: () {
                                    setState(() {
                                      if (weight > 1) {
                                        weight--;
                                      }
                                    });
                                  },
                                  icon: Icons.remove,
                                ),
                              ),
                              Expanded(
                                child: RoundIconButton(
                                  onPress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardBG: kActiveCardBackground,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTxtStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kBigTxtStyle,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: RoundIconButton(
                                  onPress: () {
                                    setState(() {
                                      if (age > 1) {
                                        age--;
                                      }
                                    });
                                  },
                                  icon: Icons.remove,
                                ),
                              ),
                              Expanded(
                                child: RoundIconButton(
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MainButton(
              title: 'CALCULATE YOUR BMI',
              onPress: () {
                BMICalculator newPerson = BMICalculator(
                  height: height,
                  weight: weight,
                  age: age,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsView(
                      bmi: newPerson.getBMI(),
                      message: newPerson.getMessage(),
                      label: newPerson.getLabel(),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
