
import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  ReusableCard( {required this.colour, required this.cardChild,this.onPress});
  final Color colour;
  final Widget cardChild;
  final VoidCallback? onPress;
 
   
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
            margin: EdgeInsets.all(7.0),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: colour,
            ),
          ),
    );
  }
}
