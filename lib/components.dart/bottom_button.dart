import 'package:flutter/material.dart';
import 'package:calculator_bmi/constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({required this.text, required this.route});
 final String text;
 final VoidCallback route;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: route,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
            ),
        ),
        color: bottomContainerColor,
        width: double.infinity,
        height: bottomContainerHeight,
        padding: EdgeInsets.only(bottom: 4.0),
        margin: EdgeInsets.only(top: 3.0),
      ),
    );
  }
}
