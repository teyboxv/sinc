import 'package:flutter/material.dart';
import 'bottomAddButton.dart';

// Define a StatefulWidget because the navigation bar needs to maintain
// its own state (which item is currently selected).
class CustomNavBar extends StatefulWidget {
  // Callback function to notify the parent widget when a tab is selected.
  // We'll uncomment and use this later for page navigation.
  final Function(int) onTapSelected;

  // Allows the parent widget to specify which tab should be selected initially.
  final int initialIndex;
  
  // Constructor for the CustomNavBar widget.
  // It requires the onTapSelected callback and optionally takes an initialIndex.
  const CustomNavBar({
    super.key, // Standard key parameter for widgets
    required this.onTapSelected, // Uncomment later
    this.initialIndex = 0, // Default to the first tab (index 0) if not provided

  });

  // Creates the mutable state for this widget.
  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

// This class holds the mutable state for the CustomNavBar widget.
class _CustomNavBarState extends State<CustomNavBar> {
  // State variable to keep track of the currently selected tab's index.
  // 'late' means it will be initialized before it's used (in initState).
  late int _selectedIndex;

  // This method is called once when the stateful widget is inserted into the widget tree.
  // It's the perfect place to initialize state variables.
  @override
  void initState() {
    super.initState(); // Always call super.initState() first.
    // Initialize _selectedIndex with the value passed from the parent widget.
    _selectedIndex = widget.initialIndex;
  }

  // This method is called when a navigation item is tapped.
  void _onItemTapped(int index) {
    // Call setState to rebuild the widget with the new selected index.
    // This ensures the UI updates to reflect the new selection.
    setState(() {
      _selectedIndex = index;
    });
    // Notify the parent widget about the tap (uncomment later).
    widget.onTapSelected(index);
    // print("Tapped index: $index"); // Useful for debugging during development.
  }

  // Helper function to build the UI for a single navigation item.
  // Takes the icon, label text, and the item's index as input.
  Widget _buildNavItem(IconData icon, String label, int index) {
    // Determine if this item is the currently selected one.
    bool isSelected = _selectedIndex == index;

    // Use InkWell to make the item tappable and provide visual feedback (ripple effect).
    return InkWell(
      // When tapped, call the _onItemTapped function with this item's index.
      onTap: () => _onItemTapped(index),
      // Optional: Customize the ripple effect area to be circular if desired.
      // borderRadius: BorderRadius.circular(30),
      child: Container( // Using a Container for padding and structure.
        // Add padding around the icon and text.
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column( // Arrange the icon and text vertically.
          mainAxisSize: MainAxisSize.min, // Use minimum space.
          mainAxisAlignment: MainAxisAlignment.center, // Center items vertically.
          children: <Widget>[
            Icon(
              icon,
              // Set the icon color based on selection state.
              // Use a distinct color for the selected item (e.g., primary color).
              // Use a less prominent color for unselected items (e.g., grey).
              color: isSelected ? const Color(0xFF0C2027) : const Color(0xFF0F2C37), // Example colors
              size: 24.0, // Standard icon size.
            ),
            
            Text(
              label,
              style: TextStyle(
                // Set the text color based on selection state, similar to the icon.
                color:  isSelected ? const Color(0xFF0C2027) : const Color(0xFF0F2C37), // CHANGE HERE: Use 0xFF for alpha
                // Optionally adjust font weight or size for the selected item.
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 12.0, // Standard font size for nav bar labels.
              ),
            ),
          ],
        ),
      ),
    );
  }


  // This method describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    // The main container for the navigation bar background.
    return Container(
      // Set the height of the navigation bar.
      height: 70, // Adjusted height
      // Apply decoration to the container (background color, shadows, etc.).
      decoration: BoxDecoration(
        // Set the background color of the navigation bar.
        color: Color(0xFFCFD8C7),
        // Add a subtle shadow above the navigation bar for depth.
         boxShadow: [
           BoxShadow(
             color: Colors.black.withOpacity(0.1), // Shadow color
             spreadRadius: 0, // How far the shadow spreads
             blurRadius: 8, // How blurry the shadow is
             offset: const Offset(0, -2), // Position the shadow slightly above (negative Y)
           ),
         ],
      ) ,
      // Use a Row to arrange the navigation items horizontally.
      child: Row(
        // Distribute the items evenly with space around them.
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // The list of widgets (navigation items) to display in the Row.
        children: [
          // Call the helper function to build the 'Home' item (index 0).
          _buildNavItem(Icons.home_filled, "Home", 0),
          // Call the helper function to build the 'Search' item (index 1).
          _buildNavItem(Icons.search, "Search", 1),

          // Use the Bottomaddbutton widget
          Bottomaddbutton(
            onTap: () {
              // Define the action for the Add button here
              print("Add button tapped!");
              // Example: Navigate to a new screen
              // Navigator.push(context, MaterialPageRoute(builder: (context) => AddItemScreen()));
              // Example: Show a modal bottom sheet
              // showModalBottomSheet(...);
            },
          ),

          // Call the helper function to build the 'Favorite' item (index 2).
          _buildNavItem(Icons.favorite_border, "Favorite", 2),
          // Call the helper function to build the 'Account' item (index 3).
          _buildNavItem(Icons.person_outline, "Account", 3),
        ],
      ),
    );
  }
}