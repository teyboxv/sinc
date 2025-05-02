import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key, required this.title, required this.passedFunc});
  final String title;
  final VoidCallback passedFunc;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.passedFunc(); // Execute the callback when button is released
      },
      
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      
      
      child: Container(
        padding: EdgeInsets.all(22),
        margin: EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(color: (isPressed ?Color.fromRGBO(12, 32, 39, 0.4) : Color.fromRGBO(12, 32, 39, 1) ), borderRadius: BorderRadius.circular(8)),
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