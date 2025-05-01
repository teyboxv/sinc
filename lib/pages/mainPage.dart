import 'package:flutter/material.dart';
import 'package:sincapp/components/BottomNavBar/customNavBar.dart';
import 'package:sincapp/components/app_bar.dart';
import 'package:sincapp/components/bottom_nav_bar.dart';
import 'package:sincapp/components/Filters/filters_list.dart';
import 'package:sincapp/components/Posts/signlePost.dart';
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
            SignlePost(title: "My new Apple MacBook Pro M2 ", likes: "2.7",views: "14k", comments: "1.1k", date: "3 days ago" , image: "image"),
            SignlePost(title: "My new Apple MacBook Pro M2 ", likes: "2.7",views: "14k", comments: "1.1k", date: "3 days ago" , image: "image"),
            SignlePost(title: "My new Apple MacBook Pro M2 ", likes: "2.7",views: "14k", comments: "1.1k", date: "3 days ago" , image: "image"),
            SignlePost(title: "My new Apple MacBook Pro M2 ", likes: "2.7",views: "14k", comments: "1.1k", date: "3 days ago" , image: "image"),
            SignlePost(title: "My new Apple MacBook Pro M2 ", likes: "2.7",views: "14k", comments: "1.1k", date: "3 days ago" , image: "image"),
            
            ]
            
          ),
          
      ),
      bottomNavigationBar: CustomNavBar(),
      );
      
  }
}