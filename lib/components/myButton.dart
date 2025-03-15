import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(22),
      margin: EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(color: Color(0xFF0C2027), borderRadius: BorderRadius.circular(8)),
      child: Center(
         child: Text(
          "Login",
          style: TextStyle(
            color: Color(0xFFCFD8C7),
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: "Urbanist",
          ),
          ),
      ),
    );
  }
}