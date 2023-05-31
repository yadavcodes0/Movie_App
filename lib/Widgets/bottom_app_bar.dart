import 'package:flutter/material.dart';
import 'package:pikashow_clone/pages/boollywood_page.dart';
import 'package:pikashow_clone/pages/liveTv_page.dart';
import 'package:pikashow_clone/pages/series_page.dart';

import '../pages/hollywood_page.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BoollyWoodPage(),
                ),
              );
            },
            child: const Text(
              'Bollywood',
              style: TextStyle(color: Colors.yellow),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HollyWoodPage(),
                ),
              );
            },
            child: const Text(
              'HollyWood',
              style: TextStyle(color: Colors.yellow),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SeriesPage(),
                ),
              );
            },
            child: const Text(
              'Series',
              style: TextStyle(color: Colors.yellow),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LiveTvPage(),
                ),
              );
            },
            child: const Text(
              'LiveTV',
              style: TextStyle(color: Colors.yellow),
            ),
          ),
        ],
      ),
    );
  }
}