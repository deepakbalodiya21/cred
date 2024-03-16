import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<IconData> icons;
  final int initialIndex;
  final Function(int) onIconTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.icons,
    required this.initialIndex,
    required this.onIconTap,
  }) : super(key: key);


  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _selectedIndex; // Initialize _selectedIndex here instead

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Assign value in initState
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.icons.length, (index) {
          final isSelected = index == _selectedIndex;
          return InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
                widget.onIconTap(index); // Call parent's onIconTap as well
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icons[index],
                  color: isSelected ? Colors.black : Colors.grey,
                  size: 30.0,
                ),
                if (isSelected)
                  Text(
                    // Optional: Add text labels below icons (if desired)
                    index == 0 ? 'Home' : (index == 1 ? 'Cards' : (index == 2 ? 'Notifications' : 'Settings')),
                    style: TextStyle(color: Colors.black, fontSize: 12.0),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
