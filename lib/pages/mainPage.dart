import 'package:flutter/material.dart';
import 'package:sincapp/components/app_bar.dart';
import 'package:sincapp/components/bottom_nav_bar.dart';
import 'package:sincapp/components/filters_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCFD8C7),
      body: SingleChildScrollView(
          child: Column(
            children:[ Padding(
              padding: const EdgeInsets.only(left:40 , right:10),
              child: appBar()
            ),

            FiltersList(), 
            
            ]
            
          ),
          
      ),
      bottomNavigationBar: BottomNavBar(),
      );
      
  }
}