import 'package:calculator_bmi/constants.dart';
import 'package:flutter/material.dart';


class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children:<Widget> [
        Icon(
          icon,
          size: 50.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
         label,
          style: labelTextStyle,
          ),
      ],
    );
  }
}