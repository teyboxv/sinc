import 'package:flutter/material.dart';

class Bottomaddbutton extends StatelessWidget {
  final VoidCallback? onTap;
  const Bottomaddbutton({super.key , required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Outer InkWell for tap detection and ripple effect
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(), // Keep the circular ripple
      // Outer Container: Dark background, main size
      child: Container(
        height: 50, // Overall size
        width: 50,
        decoration: const BoxDecoration(
          color: Color(0xFF0C2027), // Dark background color
          shape: BoxShape.circle,
          // NO border here on the outer container
        ),
        // Use Padding to create the space for the inner white line
        child: Padding(
          // Adjust padding to control the thickness of the outer dark ring
          padding: const EdgeInsets.all(1.5), // This space becomes the dark ring
          // Inner Container: Represents the white line border
          child: Container(
            
            
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // White border creates the visible line
              border: Border.all(
                color: Colors.white, // The color of the line itself
                // Increase this value to make the white line thicker
                width: 3.0, // Example: Increased from 1.5 to 3.0
              ),
              // Background inside the white line is transparent,
              // showing the outer container's dark color.
              // color: Colors.transparent, // Default is transparent
            ),
            // Center the icon within the white line border
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white, // White color for the '+' icon
                size: 25, // Adjust icon size as needed
              ),
            ),
          ),
        ),
      ),
    );
  }
}