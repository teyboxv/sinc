import 'dart:core';
import 'package:flutter/material.dart';
import 'package:sincapp/components/BottomNavBar/customNavBar.dart';
import 'package:sincapp/components/app_bar.dart';
import 'package:sincapp/components/Filters/filters_list.dart';
import 'package:sincapp/components/Posts/signlePost.dart';
import 'package:sincapp/pages/FeedView.dart';
import 'package:sincapp/pages/accountPage.dart';
import 'package:sincapp/pages/favoritePage.dart';
import 'package:sincapp/pages/postPage.dart';
import 'package:sincapp/pages/searchPage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sincapp/services/Auth/auth_providers.dart';
class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPage();
}

class _MainPage extends ConsumerState<MainPage> {
  int _selectedIndex = 0;
  final screens = <Widget>[
    const Feedview(),
    const Searchpage(),
    const Postpage(),
    const Favoritepage(),
    const Accountpage(),
  ]; // Add semicolon here
  Widget pageSelection() { 
    return screens[_selectedIndex];
  }
  void onNavBarTap(int index) {
    setState(() {
      // Map CustomNavBar index to screens index
      if (index == 0) {
        _selectedIndex = 0; // Home -> Feedview
      } else if (index == 1) {
        _selectedIndex = 1; // Search -> Searchpage
      } else if (index == 2) {
        _selectedIndex = 3; // Favorite -> Favoritepage
      } else if (index == 3) {
        _selectedIndex = 4; // Account -> Accountpage
      }
      // The Add button (Postpage) needs separate handling, likely in CustomNavBar's Bottomaddbutton onTap
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCFD8C7),
      body: pageSelection(),
      bottomNavigationBar: CustomNavBar(
        initialIndex: _selectedIndex, // Add this line
        onTapSelected: onNavBarTap,
      ),
    );
  }
}