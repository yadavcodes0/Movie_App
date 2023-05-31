import 'package:flutter/material.dart';
import 'package:pikashow_clone/Widgets/bottom_app_bar.dart';

import '../Widgets/center_icons.dart';
import '../Widgets/movie_slider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.transparent,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: MovieSlider(height: height),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: height * 0.5,
              width: width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black38,
                    Colors.black87,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Column(
                    children: const [
                      CenterIcons(),
                      Text(
                        'Version 82',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Bottom(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
