import 'package:flutter/material.dart';

class Filteritem extends StatefulWidget {
   Filteritem({super.key, required this.title, required this.isPressed});
  final String title;
   bool isPressed;
  @override
  State<Filteritem> createState() => _FilteritemState();
}

class _FilteritemState extends State<Filteritem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap:() {
          setState(() {
            widget.isPressed = !widget.isPressed;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: widget.isPressed ? const Color(0XFF0C2027)  : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:  const Color(0XFF0C2027),
              width: 1.5,
            ),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.isPressed ? Colors.white : Colors.black87,
              fontWeight: widget.isPressed ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}