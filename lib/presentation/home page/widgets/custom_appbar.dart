// Custom AppBar
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Ali Mossa',
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      centerTitle: true,
      leading: const Icon(Icons.menu, color: Colors.black),
      actions: const [
        Icon(Icons.notifications, color: Colors.black),
        SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}