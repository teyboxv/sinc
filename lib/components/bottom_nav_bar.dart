import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Add"),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Add"),
    ],
    backgroundColor: Color(0xFFCFD8C7),
    
    
    );
  }
}