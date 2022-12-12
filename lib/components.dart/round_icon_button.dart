import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
   RoundIconButton({required this.icon, required this.onPresse});
   final IconData icon;
   final VoidCallback onPresse;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
         child: Icon(icon),
         elevation: 0.0,
         onPressed: onPresse,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
    
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      
    );
  }
}