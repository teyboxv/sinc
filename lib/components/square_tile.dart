import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF6E7C77)),
        borderRadius: BorderRadius.circular(8),
        ),
      child: Image.asset(
        imagePath,
        height: 26,
        width: 26,
        
        
        ),
    );
  }
}