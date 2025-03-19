import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key, required this.title});
  final String title;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
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
        padding: EdgeInsets.all(22),
        margin: EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(color: Color(isPressed ? 0xFFA3D5E7 : 0xFF0C2027), borderRadius: BorderRadius.circular(8)),
        child: Center(
           child: Text(
            widget.title,
            style: TextStyle(
              color: Color(0xFFCFD8C7),
              fontSize: 15,
              fontWeight: FontWeight.w600,
              
              fontFamily: "Urbanist.bold",
            ),
            ),
        ),
      ),
    );
  }
}