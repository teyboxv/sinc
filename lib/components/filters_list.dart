import 'package:flutter/material.dart';

class FiltersList extends StatefulWidget {
  const FiltersList({super.key});

  @override
  State<FiltersList> createState() => _FiltersListState();
}

class _FiltersListState extends State<FiltersList> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(onPressed:(){},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        minWidth: 40,
        color: Color( 0xFF0C2027),
        )
      ],
    );
  }
}