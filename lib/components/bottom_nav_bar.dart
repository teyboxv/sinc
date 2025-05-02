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
      BottomNavigationBarItem(icon: Icon(Icons.home,color: Color.fromRGBO(12, 32, 39, 0),), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
      
    ],
    backgroundColor: Color(0xFFCFD8C7),
    
    
    );
  }
}