import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: SizedBox(
                  width: 330,
                  height: 70,
                  child: TextField(
                    controller: controller,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                        fontFamily: "Urbanist",
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFDADADA)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: Color(0xFFF7F8F9),
                      filled: true,
                      
                      //add padding to make it taller
                      contentPadding: EdgeInsets.symmetric(horizontal: 16 , vertical: 20),
                      
                    ),
                  ),
                ),
              );
  }
}