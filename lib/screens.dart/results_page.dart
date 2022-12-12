import 'package:calculator_bmi/constants.dart';
import 'package:calculator_bmi/screens.dart/input_page.dart';
import 'package:calculator_bmi/components.dart/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:calculator_bmi/components.dart/bottom_button.dart';
import 'package:calculator_bmi/calculator_brain.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiResult, required this.resultText,required this.interpretation});
  
   final String bmiResult;
   final String resultText;
   final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your result',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
         Expanded(
          flex: 5,
          child:ReusableCard(
            colour: activeCardColor, 
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 23.0,
                        fontStyle: FontStyle.normal,
                      ),
                      ),
                      Text(
                        bmiResult,
                        style: bmiTextStyle,
                        ),
                        Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.normal,
                          ),
                          ), 
              ],
            ),
            ),
          ),
          BottomButton(
           text: 'RE-CALCULATE', 
            route: (){
            Navigator.pop(context);
           },
          ),
        ],
        ),
    );
  }
}