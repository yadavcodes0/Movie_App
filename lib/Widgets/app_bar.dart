import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.yellow,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios, color: Colors.yellow),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
