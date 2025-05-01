import 'package:flutter/material.dart';
import 'package:sincapp/components/Filters/FilterItem.dart';

enum Filters{ 
  newPosts,forYou,trending,all
}

class FiltersList extends StatefulWidget {
  const FiltersList({super.key});

  @override
  State<FiltersList> createState() => _FiltersListState();
}



class _FiltersListState extends State<FiltersList> {
  bool newPosts = true;
  bool forYou = false;
  bool trending = false;
  bool all = false;
  
  void changeFilter(Filters filter) {
    setState(() {
      switch(filter) {
        case Filters.newPosts:
          newPosts = !newPosts;
          setState(() {
          forYou = false;
          trending = false;
          all = false;  
          });
          
          break;
        case Filters.forYou:
          forYou = !forYou;
          
          setState(() {
          newPosts = false;
          trending = false;
          all = false;  
          });
          
          break;
        case Filters.trending:
          trending = !trending;
          
          setState(() {
          newPosts = false;
          forYou = false;
          all = false;  
          });

          
          break;
        case Filters.all:
          
          
          setState(() {
          newPosts = false;
          forYou = false;
          trending = false;  
          });

          
          break;
      }
    });
  }
  // bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:3.0,top:10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => changeFilter(Filters.newPosts),
            child: Filteritem(title: "New Posts", isPressed: newPosts)),
          GestureDetector(
            onTap: () => changeFilter(Filters.trending),
            child: Filteritem(title: "Trending", isPressed: trending)),
          GestureDetector(
            onTap: () => changeFilter(Filters.forYou),
            child: Filteritem(title: "For You", isPressed: forYou)),
          GestureDetector(
            onTap: () => changeFilter(Filters.all),
            child: Filteritem(title: "All", isPressed: all)),
        ],
      ),
    );
  }
}