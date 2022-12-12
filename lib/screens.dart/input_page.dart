import 'package:calculator_bmi/calculator_brain.dart';
import 'package:calculator_bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator_bmi/components.dart/icon_content.dart';
import 'package:calculator_bmi/components.dart/reusable_card.dart';
import 'package:calculator_bmi/components.dart/round_icon_button.dart';
import 'package:calculator_bmi/screens.dart/results_page.dart';
import 'package:calculator_bmi/components.dart/bottom_button.dart';
enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
 

  Gender?selectedGender; 
  int height=180;    
  int weight=60;
  int age=30;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         Expanded(child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children:<Widget> [
            Expanded(
              flex: 1,
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender=Gender.male;
                  });
                },
                colour:
                selectedGender==Gender.male ? activeCardColor:inactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconContent(
                      icon: FontAwesomeIcons.mars,label: 'MALE',
                      ),
                  ],
                ),
              ),
            ),
             Expanded(
             flex: 1,
              child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender=Gender.female;
                  });
                },
                colour: selectedGender==Gender.female ? activeCardColor:inactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
                  ],
                ),
                ),
           
            ),
          ],
         ),),
         Expanded(
          flex: 1,
          child: ReusableCard(
          colour: inactiveCardColor, 
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text('HEIGHT',
            style: labelTextStyle,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children:<Widget> [
              Text(
                height.toString(),
                style: numberTextStyle,
                ),
                Text(
                  'cm',
                  style: labelTextStyle ,
                ),
            ],),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Color(0xFF8D8E98),
                thumbColor: Color(0xFFEB1555),
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                
              ),
              child: Slider(
              value: height.toDouble(), 
              min: 120.0,
              max: 220,
          
              onChanged: (double newValue) {
               setState(() {
                 height=newValue.round();
               });
              },
              ),
            ),
          ],
          ), 
          ),
        
          ),
          Expanded(
            flex: 1,
            child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children:<Widget> [
            Expanded(
              child: ReusableCard(
              colour: inactiveCardColor,
               cardChild:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children:<Widget> [
                  Text(
                    'WEIGHT',
                    style: labelTextStyle,
                    ),
                  Text(
                      weight.toString(),
                      style: numberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: Icons.remove,
                          onPresse: (){
                            setState(() {
                              weight--;
                            });
                          },
                          ),
                        SizedBox(
                          width: 6.0,
                        ),
                         RoundIconButton(
                          icon: Icons.add,
                          onPresse: (){
                            setState(() {
                              weight++;
                            });
                          },
                          ),
                      ],
                    ),
                 ],
               ),
              ),
           
            ),
             Expanded(
              flex: 1,
              child: ReusableCard(
              colour: inactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                  'AGE',
                  style: labelTextStyle,
                  ),
                  Text(
                    age.toString(),
                    style: numberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: Icons.remove,
                          onPresse: (){
                            setState(() {
                              age--;
                            });
                          },
                          ),
                        SizedBox(
                          width: 6.0,
                        ),
                         RoundIconButton(
                          icon: Icons.add,
                          onPresse:(){
                            setState(() {
                              age++;
                            });
                          } ,
                          ),
                      ],
                  )
                ],
                )
              ),
            ),
          ],
         ),),
        BottomButton(
          text: 'CALCULATE',
          route:() {
           CalculatorBrain calc= CalculatorBrain(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
              bmiResult: calc.calculateBMI() ,
              resultText: calc.getresult(),
              interpretation: calc.getInterpretation(),
            )));
          }),
         
  ],
  ),
      
    
    );
  }
}

