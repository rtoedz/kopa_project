import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.black, // Default background color
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor, // Custom background color
      title: Text(
        title, // Custom title
        style: TextStyle(
          fontFamily: 'MBCorpoATitle',
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.white, // Title color
        ),
      ),
      actions: actions, // Optional custom actions (like buttons or icons)
      leading: leading,
      centerTitle: true, // Center the title
      elevation: 4, // Add shadow under the app bar
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0); // Height of AppBar
}
