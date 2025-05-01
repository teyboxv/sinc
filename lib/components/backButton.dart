import 'package:flutter/material.dart';

class Backbutton extends StatefulWidget {
  const Backbutton({super.key});

  @override
  State<Backbutton> createState() => _BackbuttonState();
}

class _BackbuttonState extends State<Backbutton> {
  bool isPressed = false;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isPressed = !isPressed;
          isPressed = !isPressed;
        });
      },
      
      
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22),
        width: 41,
        height: 41,
        decoration: BoxDecoration(
          color: Color(isPressed ? 0xFFA3D5E7 : 0xFFE8ECF4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: SizedBox(
            width: 19,
            height: 19,
            child: Image.asset(
              "lib/assets/images/back_arrow.png",
              color: Color(0xFF1E232C),
              
            ),
          ),
        ),
      ),
    );
  }
}